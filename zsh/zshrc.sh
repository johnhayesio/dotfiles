# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history

# Aliases
	alias v="vim -p"
  alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
  alias python="/usr/local/bin/python3"
  alias wtr="curl -4 http://wttr.in/Moscow\?m"
  alias md="/Applications/Typora.app/Contents/MacOS/Typora"  

# GIT
  alias gpo="git push origin master"
  alias ga="git add"
  alias gc="git commit -v"
  alias gca="git commit -av"
  alias gp="gca && gpa"
  alias gs="git status"
  alias gl="git log -3"
  alias gl1="git log -1"
  alias gl2="git log -2"
  alias gpa="gpo --tags"
  alias gpl="git push origin master && git push live master"
  alias gpull="git pull origin master"
  alias gcm="git checkout master"	
	# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
	# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# Settings
	export VISUAL=vim

source ~/dotfiles/zsh/plugins/fixls.zsh

#Functions
	# Custom cd
	c() {
	cd $1;
		ls;
  }
  alias cd="c"

# For vim mappings: 
	stty -ixon

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/keybindings.sh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source ~/dotfiles/zsh/prompt.sh
