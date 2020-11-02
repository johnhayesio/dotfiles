source $HOME/dotfiles/config/zsh/jobs-pro.sh
source $HOME/dotfiles/config/zsh/git-pro.sh

autoload -U colors && colors

setopt PROMPT_SUBST

set_prompt() {
	# [
	# Sudo and Jobs
	_SUDO_EXISTS=$(sudo -n uptime 2>/dev/null|grep "load"|wc -l)
	_JOBS_EXISTS=$(jobs|wc -l)
	if ([ ${_SUDO_EXISTS} -gt 0 ] && [ ${_JOBS_EXISTS} -gt 0 ]); then
		PS1="%{$fg_bold[red]%}SUDO%{$reset_color%}"
		PS1+=" "
		PS1+="$(_jp_prompt)"
		PS1+=" "
		PS1+="%B%40<..<%~"
	elif [ ${_SUDO_EXISTS} -gt 0 ]; then
		PS1="%{$fg_bold[red]%}SUDO%{$reset_color%}"
		PS1+=" "
		PS1+="%B%40<..<%~"
	elif [ ${_JOBS_EXISTS} -gt 0 ]; then
		PS1="$(_jp_prompt)"
		PS1+=" "
		PS1+="%B%40<..<%~"
	else
		PS1="%B%40<..<%~"
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
