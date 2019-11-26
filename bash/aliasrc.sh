#!/bin/sh
# System
alias hs="history | grep"
alias mem="top -l1 | grep PhysMem"
alias ka='killall'
alias sdn='sudo shutdown -h now'
alias randpass="openssl rand -base64 "
alias rn="ranger"

# Terminal
alias o="open"
alias q="exit"
alias c="clear && ls"
alias h="$HOME && ls"
alias ..="cd .."
alias ...="cd ../.."
alias rd="rm -rf "
alias md="mkdir "

alias tmux="vim $HOME/dotfiles/tmux/tmux.conf"
alias vimrc="vim $HOME/dotfiles/vim/vimrc.vim"
alias zshrc="vim $HOME/dotfiles/zsh/zshrc.sh"

# List
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
alias t2="~/dotfiles/tmux/tmuxpane2"
alias t3="~/dotfiles/tmux/tmuxpane3"

# VIM
alias v='vim -p'
alias sv="sudo vim -p"
alias vcp="vim +PlugClean +qall"
alias vip="vim +PlugInstall +qall"
alias vup="vim +PlugUpdate"

# Apps
alias cc='calcurse -D ~/.config/calcurse'
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias python="/usr/local/bin/python3"
alias wtr="curl -4 http://wttr.in/Moscow"
alias myip="curl ifconfig.co && curl ifconfig.co/city && curl ifconfig.co/country"
alias mark="/Applications/Typora.app/Contents/MacOS/Typora"
alias tgl="toggl"
alias server="live-server --no-browser"
alias nb="newsboat"
alias pc="castero"

# NPM
alias nis="npm install --save "
alias nid="npm install --save-dev "
alias nig="npm install --global "
alias nls="npm list -g --depth=0"

# Brew
alias bud="brew update && brew upgrade && brew cask update && brew cleanup && brew cask cleanup"
alias bip="brew search | eval \"fzf -m --header='[brew:install]'\""

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

# Code Starter Kits
alias css="git clone https://github.com/johnhayesio/simplecss.git"
alias react="git clone https://github.com/johnhayesio/parcelReact.git"

# Directories
alias dotfiles="cd $HOME/dotfiles && clear && ls"
alias library="cd $HOME/Library && clear && ls"
alias dev="cd $HOME/Documents/projects-FEWD && clear && ls"
alias home="$HOME && clear && ls"
alias drives="df -h"
alias usage="du -h -d1"

# youtube-dl
alias ytv="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -v -o '$HOME/Documents/yt_DLs/Videos/%(title)s.%(ext)s'"
ytp="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -v -o '$HOME/Documents/yt_DLs/Playlists/%(playlist)s/%alias (playlist_index)s - %(title)s.%(ext)s'"
alias ytm="youtube-dl -f mp3 -v -o '$HOME/Documents/yt_DLs/Audio/%(title)s.%(ext)s'"

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

# FZF
  se() { du -a ~/.scripts/* ~/.config/* | awk '{print $2}' | fzf | xargs -o $EDITOR ;}
  vf() { fzf | xargs -o $EDITOR ;}

 # Caniuse
 ciu() { caniuse | sort -rn | eval "fzf ${FZF_DEFAULT_OPTS} --ansi --header='[caniuse:features]'" | sed -e 's/^.*%\ *//g' | sed -e 's/   .*//g'; }
