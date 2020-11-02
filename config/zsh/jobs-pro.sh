################################################################################
# Jobs Pro Prompt
# A zsh addon for showing jobs within customized prompts
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

# Display the count of each if non-zero:
# - detached screens sessions and/or tmux sessions running on the host
# - attached running jobs (started with $ myjob &)
# - attached stopped jobs (suspended with Ctrl-Z)
_jp_jobcount_color() {
  typeset -i _JP_ENABLE_DETACHED_SESSIONS _JP_ENABLE_SCREEN _JP_ENABLE_TMUX
  command -v screen >/dev/null ; _JP_ENABLE_SCREEN=!$?
  command -v tmux >/dev/null   ; _JP_ENABLE_TMUX=!$?
  (( _JP_ENABLE_DETACHED_SESSIONS = ( _JP_ENABLE_SCREEN || _JP_ENABLE_TMUX ) ))

  local ret=""
  local -i r s

  # Count detached sessions
  if (( _JP_ENABLE_DETACHED_SESSIONS )); then
    local -i detached=0
    (( _JP_ENABLE_SCREEN )) && detached=$(screen -ls 2> /dev/null | \grep -c "[Dd]etach[^)]*)$")
    (( _JP_ENABLE_TMUX )) && detached+=$(tmux list-sessions 2> /dev/null | \grep -cv "attached")
    (( detached > 0 )) && ret+="%{$fg[yellow]%}${detached}d%{$reset_color%}"
  fi

  # Count running jobs
  if (( r = $(jobs -r | wc -l) )); then
    [[ -n "$ret" ]] && ret+="/"
    ret+="%{$fg_bold[yellow]%}${r}&%{$reset_color%}"
  fi

  # Count stopped jobs
  if (( s = $(jobs -s | wc -l) )); then
    [[ -n "$ret" ]] && ret+="/"
    ret+="%{$fg_bold[yellow]%}${s}z%{$reset_color%}"
  fi

  echo -nE "$ret"
}

_jp_prompt() {
  local prompt
  prompt=$(_jp_jobcount_color)
  echo -nE "$prompt"
}
