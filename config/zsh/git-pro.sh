# Escape the given strings
# Must be used for all strings injected in PS1 that may comes from remote sources,
# like $PWD, VCS branch names...
gp_escape() {
  arg="${1//\\/\\\\}"
  echo -nE "${arg//\%/%%}"
}

# Get the branch name of the current directory
gp_git_branch() {
  \git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

  local branch
  # Recent versions of Git support the --short option for symbolic-ref, but
  # not 1.7.9 (Ubuntu 12.04)
  if branch="$(\git symbolic-ref -q HEAD)"; then
    gp_escape "${branch#refs/heads/}"
  else
    # In detached head state, use commit instead
    # No escape needed
    \git rev-parse --short -q HEAD
  fi
}

# Display additional information if HEAD is in merging, rebasing
# or cherry-picking state
gp_git_head_status() {
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
gp_git_branch_color() {
  local branch
  branch="$(gp_git_branch)"
  if [[ -n "$branch" ]]; then

  local end
  end="%{$fg[red]%}$(gp_git_head_status)%{$reset_color%}"

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
  shortstat="$(LC_ALL=C \git diff --shortstat HEAD -- 2>/dev/null)"

  if [[ -n "$shortstat" ]]; then
    local u_stat # shorstat of *unstaged* changes
    u_stat="$(LC_ALL=C \git diff --shortstat 2>/dev/null)"
    u_stat=${u_stat/*changed, /} # removing "n file(s) changed"

    local i_lines # inserted lines
    if [[ "$u_stat" = *insertion* ]]; then
      i_lines=${u_stat/ inser*}
    else
      i_lines=0
    fi

    local d_lines # deleted lines
    if [[ "$u_stat" = *deletion* ]]; then
      d_lines=${u_stat/*\(+\), }
      d_lines=${d_lines/ del*/}
    else
      d_lines=0
    fi

    local has_lines
    has_lines="+$i_lines/-$d_lines"

    if [[ -n "$has_commit" ]]; then
      # Changes to commit and commits to push
      ret="%{$fg[red]%}${branch}%{$reset_color%}(%{$fg[magenta]%}$has_lines%{$reset_color%},$has_commit)"
    else
      ret="%{$fg[red]%}${branch}%{$reset_color%}(%{$fg[magenta]%}$has_lines%{$reset_color%})" # changes to commit
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

gp_prompt() {
  local prompt
  prompt="$(gp_git_branch_color)"
  echo -nE "$prompt"
}
