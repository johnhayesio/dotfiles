################################################################################
#   .oooooo.     o8o      .      ooooooooo.
#  d8P'  `Y8b    `"'    .o8      `888   `Y88.
# 888           oooo  .o888oo     888   .d88' oooo d8b  .ooooo.
# 888           `888    888       888ooo88P'  `888""8P d88' `88b
# 888     ooooo  888    888       888          888     888   888
# `88.    .88'   888    888 .     888          888     888   888
#  `Y8bood8P'   o888o   "888"    o888o        d888b    `Y8bod8P'

# A zsh addon for showing git status within customized prompts
################################################################################

# Licensed under the AGPL version 3
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Escape the given strings
_gp_escape() {
  arg="${1//\\/\\\\}"
  echo -nE "${arg//\%/%%}"
}

# Get the branch name of the current directory
_gp_git_branch() {
  \git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

  local branch
  # Recent versions of Git support the --short option for symbolic-ref, but
  # not 1.7.9 (Ubuntu 12.04)
  if branch="$(\git symbolic-ref -q HEAD)"; then
    _gp_escape "${branch#refs/heads/}"
  else
    # In detached head state, use commit instead
    # No escape needed
    \git rev-parse --short -q HEAD
  fi
}

# Display additional information if HEAD is in merging, rebasing
# or cherry-picking state
_gp_git_head_status() {
  local gitdir
  gitdir="$(\git rev-parse --git-dir 2>/dev/null)"
  if [[ -f "${gitdir}/MERGE_HEAD" ]]; then
    echo " MERGING"
  elif [[ -d "${gitdir}/rebase-apply" || -d "${gitdir}/rebase-merge" ]]; then
    echo " REBASING"
  elif [[ -f "${gitdir}/CHERRY_PICK_HEAD" ]]; then
    echo " CHERRY-PICKING"
  fi
}

# Set a color depending on the branch state:
# - green if the repository is up to date
# - yellow if there is some commits not pushed
# - red if there is changes to commit
#
# Add the number of pending commits and the impacted lines.
_gp_git_branch_color() {
  local branch
  branch="$(_gp_git_branch)"
  if [[ -n "$branch" ]]; then

  local end
  end="%{$fg[red]%}$(_gp_git_head_status)%{$reset_color%}"

  if LC_ALL=C \git status --porcelain 2>/dev/null | \grep -q '^??'; then
    end="%{$fg[red]%}*$end"
  fi

  # Show if there is a git stash
  if \git rev-parse --verify -q refs/stash >/dev/null; then
    end="%{$fg[yellow]%}+$end"
  fi

  local remote
  remote="$(\git config --get branch.${branch}.remote 2>/dev/null)"

  local has_commit=""
  local commit_ahead
  local commit_behind
  if [[ -n "$remote" ]]; then
    local remote_branch
    remote_branch="$(\git config --get branch.${branch}.merge)"
    if [[ -n "$remote_branch" ]]; then
      remote_branch=${remote_branch/refs\/heads/refs\/remotes\/$remote}
      commit_ahead="$(\git rev-list --count $remote_branch..HEAD 2>/dev/null)"
      commit_behind="$(\git rev-list --count HEAD..$remote_branch 2>/dev/null)"
        if [[ "$commit_ahead" -ne "0" && "$commit_behind" -ne "0" ]]; then
          has_commit="%{$fg[yellow]%}+$commit_ahead%{$reset_color%}/%{$fg_bold[red]%}-$commit_behind%{$reset_color%}"
        elif [[ "$commit_ahead" -ne "0" ]]; then
          has_commit="%{$fg[yellow]%}$commit_ahead%{$reset_color%}"
        elif [[ "$commit_behind" -ne "0" ]]; then
          has_commit="%{$fg_bold[red]%}-$commit_behind%{$reset_color%}"
        fi
    fi
  fi

  local ret
  local shortstat # only to check for uncommitted changes
  shortstat="$(LC_ALL=C \git status --short 2>/dev/null)"

  if [[ -n "$shortstat" ]]; then
    local m_files # modified files
    m_files="$(LC_ALL=C \git status --short 2>/dev/null | \grep '^ M' | \wc -l)"
    if [[ -n "$m_files" ]]; then
      m_files=$(echo ${m_files} | awk '{$1=$1}1')
    else
      m_files=0
    fi

    local d_files # deleted files
    d_files="$(LC_ALL=C \git status --short 2>/dev/null | \grep '^ D' | \wc -l)"
    if [[ -n "$d_files" ]]; then
      d_files=$(echo ${d_files} | awk '{$1=$1}1')
    else
      d_files=0
    fi

    local has_files
    has_files="+$m_files/-$d_files"

    if [[ -n "$has_commit" ]]; then
      # Changes to commit and commits to push
      ret="%{$fg[red]%}${branch}%{$reset_color%}(%{$fg[cyan]%}$has_files%{$reset_color%},$has_commit)"
    else
      ret="%{$fg[red]%}${branch}%{$reset_color%}(%{$fg[cyan]%}$has_files%{$reset_color%})" # changes to commit
    fi
  elif [[ -n "$has_commit" ]]; then
    # some commit(s) to push
    if [[ "$commit_behind" -gt "0" ]]; then
      ret="%{$fg_bold[red]%}${branch}%{$reset_color%}($has_commit)"
    else
      ret="%{$fg[yellow]%}${branch}%{$reset_color%}($has_commit)"
    fi
  else
    ret="%{$fg[green]%}${branch}" # nothing to commit or push
  fi
  echo -nE "$ret$end"
  fi
}

_gp_prompt() {
  local prompt
  prompt="$(_gp_git_branch_color)"
  echo -nE "$prompt"
}
