# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history

# Aliases
  alias v="vim -p"
  alias o="open"
  alias q="exit"
  alias c="clear && ls"
  alias h="$HOME && ls"
  alias sl="sublime "
  alias ..="cd .."
  alias ...="cd ../.."
  alias rd="rm -rf "
  alias md="mkdir "
  alias mem="top -l1 | grep PhysMem"
  alias sv="sudo vim -p"
  alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
  alias python="/usr/local/bin/python3"
  alias wtr="curl -4 http://wttr.in/Moscow\?m"
  alias myip="curl ifconfig.co && curl ifconfig.co/city && curl ifconfig.co/country"
  alias mark="/Applications/Typora.app/Contents/MacOS/Typora"
  alias tgl="toggl"
  alias hs="history | grep"
  alias nis="npm install --save "
  alias nid="npm install --save-dev "
  alias nig="npm install --global "
  alias nls="npm list -g --depth=0"
  alias bud="brew update && brew upgrade --all && brew cask update && brew cleanup && brew cask cleanup"
  alias zshrc="vim $HOME/dotfiles/zsh/zshrc.sh"
  alias man="help"
  alias randpass="openssl rand -base64 "
  alias server="live-server --no-browser"

# ls, the common ones I use a lot shortened for rapid fire usage
  alias l="ls -lFh"
  alias la="ls -lAFh"
  alias lr="ls -tRFh"
  alias lt="ls -ltFh"
  alias ll="ls -l"
  alias lh="ls -a"
  alias ldot="ls -ld .*"
  alias lS="ls -1FSsh"
  alias lart="ls -1Fcart"
  alias lrt="ls -1Fcrt"

# tmux
  alias tn="tmux new-session -s"
  alias ta="tmux attach -t"
  alias tl="tmux ls"
  alias tk="tmux kill-session -s"
  alias ts="tmux kill-server"
  alias tb="~/dotfiles/tmux/tmuxpane"

# Directories
  alias dotfiles="cd $HOME/dotfiles && clear && ls"
  alias library="cd $HOME/Library && clear && ls"
  alias dev="cd $HOME/Documents/projects-FEWD && clear && ls"
  alias home="$HOME && clear && ls"
  alias drives="df -h"
  alias usage="du -h -d1"

# GIT
  alias gpo="git push origin master"
  alias gpi="git push -u origin master"
  alias ga="git add"
  alias gaa="git add -A"
  alias gc="git commit -v"
  alias gd="git diff"
  alias g-="git checkout -"
  alias g--="git checkout -- "
  alias g-b="git checkout -b "
  alias g-c="git checkout "
  alias gm="git merge "
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

# Code Starter Kits
  alias css="git clone https://github.com/johnhayesio/simplecss.git"
  alias react="git clone https://github.com/johnhayesio/parcelReact.git"

# youtube-dl
  alias ytv="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -v -o '$HOME/Documents/yt_DLs/Videos/%(title)s.%(ext)s' "
  alias ytp="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -v -o '$HOME/Documents/yt_DLs/Playlists/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' "
  alias ytm="youtube-dl -f mp3 -v -o '$HOME/Documents/yt_DLs/Audio/%(title)s.%(ext)s' "

# Settings
	export VISUAL=vim

source ~/dotfiles/zsh/plugins/fixls.zsh

#Functions
	# Custom cd
	d() {
	cd $1;
		ls;
  }
  alias cd="d"

  # Make dir and cd
  mkcd() {
    dir="$*";
    mkdir -p "$dir";
    cd "$dir";
  }

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
