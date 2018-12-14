# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history

# Aliases
  alias v="vim -p"
  alias o="open"
  alias q="exit"
  alias n="clear && ls"
  alias h="$HOME && ls"
  alias l="ls -laFT"
  alias ll="ls -laF"
  alias k="ls -laFTrt"
  alias kk="ls -laFrt"
  alias sl="sublime "
  alias ..="cd .. && ls"
  alias ...="cd ../.. && ls"
  alias mem="top -l1 | grep PhysMem"
  alias sv="sudo vim -p"
  alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
  alias python="/usr/local/bin/python3"
  alias wtr="curl -4 http://wttr.in/Moscow\?m"
  alias myip="curl http://ipecho.net/plain"
  alias md="/Applications/Typora.app/Contents/MacOS/Typora"
  alias mkcd="foo(){ mkdir -p "$1"; cd "$1" }; foo "
  alias hs="history | grep"
  alias nis="npm install --save"
  alias nid="npm install --save-dev"
  alias nig="npm install --global"
  alias nls="npm list -g --depth=0"
  alias bud="brew update && brew upgrade `brew outdated`"

# Directories
  alias dotfiles="cd $HOME/dotfiles && clear && ls"
  alias library="cd $HOME/Library && clear && ls"
  alias dev="cd $HOME/Documents/projects-FEWD && clear && ls"
  alias home="$HOME && clear && ls"

# GIT
  alias gpo="git push origin master"
  alias ga="git add"
  alias gaa="git add -A"
  alias gc="git commit -v"
  alias gd="git diff"
  alias g-="git checkout -"
  alias g--="git checkout -- "
  alias gca="git commit -av"
  alias gp="gca && gpa"
  alias gst="git status"
  alias gsh="git show"
  alias gl="git log -3"
  alias gl1="git log -1"
  alias gl2="git log -2"
  alias gpa="gpo --tags"
  alias gpl="git push origin master && git push live master"
  alias gpull="git pull origin master"
  alias gcm="git checkout master"	
	# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
	# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# youtube-dl
  alias ytv="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -v -o '$HOME/Documents/yt_DLs/Videos/%(title)s.%(ext)s' "
  alias ytp="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -v -o '$HOME/Documents/yt_DLs/Playlists/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' "
  alias ytm="youtube-dl -f mp3 -v -o '$HOME/Documents/yt_DLs/Audio/%(title)s.%(ext)s' "

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
