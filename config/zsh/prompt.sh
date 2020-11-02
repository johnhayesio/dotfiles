################################################################################
# Zsh Custom Prompt
# A custom zsh prompt showing sudo, jobs, git status, error codes, and
# execution times in a super friendly layout
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

source $HOME/dotfiles/config/zsh/jobs-pro.sh
source $HOME/dotfiles/config/zsh/git-pro.sh

autoload -U colors && colors

setopt PROMPT_SUBST

set_prompt() {
	# [
	# Sudo and Jobs
	_SUDO_EXISTS=$(sudo -n uptime 2>/dev/null|grep "load"|wc -l)
	if [ ${_SUDO_EXISTS} -gt 0 ]; then
		PS1="%{$fg_bold[red]%}SUDO%{$reset_color%}"
		if [[ -n "$(_jp_prompt)" ]]; then
			PS1+=" "
			PS1+="$(_jp_prompt)"
		fi
		PS1+=" "
		PS1+="%B%40<..<%~"
	else
		PS1="$(_jp_prompt)"
		PS1+=" "
		PS1+="%B%40<..<%~"
	fi

 	# Git
 	if git rev-parse --is-inside-work-tree 2>/dev/null|grep -q "true"; then
		PS1+=" "
		PS1+="%b$(_gp_prompt)"
	fi

	# Status Code
	PS1+="%(?.. %{$fg[red]%}[%?]%{$reset_color%})"

	# Timer
	if [[ $_elapsed[-1] -ne 0 ]]; then
		PS1+=" "
		PS1+="%{$fg[white]%}$_elapsed[-1]s%{$reset_color%}"
	fi

	# ]
	PS1+=" "
	PS1+="%(?.%(!.%F{white}❯%F{yellow}❯%F{red}.%F{green})❯%f.%F{red}❯%f)"
	PS1+=" "
}

precmd_functions+=set_prompt

preexec () {
   (( ${#_elapsed[@]} > 1000 )) && _elapsed=(${_elapsed[@]: -1000})
   _start=$SECONDS
}

precmd () {
   (( _start >= 0 )) && _elapsed+=($(( SECONDS-_start )))
   _start=-1
}
