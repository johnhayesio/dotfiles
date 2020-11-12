################################################################################
#  _________  _   _   _  __          _     _           _ _
# |__  / ___|| | | | | |/ /___ _   _| |__ (_)_ __   __| (_)_ __   __ _ ___
#   / /\___ \| |_| | | ' // _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __|
#  / /_ ___) |  _  | | . \  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \
# /____|____/|_| |_| |_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/
#                              |___/                             |___/

# https://johnhayes.io keybindings for zsh
################################################################################

# Up
	function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
	bindkey "^k" up_widget

# Git
	function git_prepare() {
		if [ -n "$BUFFER" ];
			then
				BUFFER="git add -A; git commit -m \"$BUFFER\" && git push"
		fi

		if [ -z "$BUFFER" ];
			then
				BUFFER="git add -A; git commit -v && git push"
		fi

		zle accept-line
	}
	zle -N git_prepare
	bindkey "^g" git_prepare

# Home
	function goto_home() {
		BUFFER="cd ~/"$BUFFER
		zle end-of-line
		zle accept-line
	}
	zle -N goto_home
	bindkey "^h" goto_home

# Clear
  function ctrl_n() {
    BUFFER="clear"
    zle accept-line
  }
  zle -N ctrl_n
  bindkey "^n" ctrl_n

# LS
  function ctrl_l() {
    BUFFER="ls -l"
    zle accept-line
  }
  zle -N ctrl_l
  bindkey "^l" ctrl_l

# Edit and rerun
	function edit_and_run() {
		BUFFER="fc"
		zle accept-line
	}
	zle -N edit_and_run
	bindkey "^v" edit_and_run

# Enter
	function enter_line() {
		zle accept-line
	}
	zle -N enter_line
	bindkey "^o" enter_line

# Sudo
	function add_sudo() {
		BUFFER="sudo "$BUFFER
		zle end-of-line
	}
	zle -N add_sudo
	bindkey "^s" add_sudo

# Set vi-cmd-mode to jj
  bindkey "jj" vi-cmd-mode
  bindkey "\e" vi-cmd-mode
