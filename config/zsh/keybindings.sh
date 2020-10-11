# up
	function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
	bindkey "^b" up_widget

# git
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

# home
	function goto_home() {
		BUFFER="cd ~/"$BUFFER
		zle end-of-line
		zle accept-line
	}
	zle -N goto_home
	bindkey "^t" goto_home

# clear
  function ctrl_n() {
    BUFFER="clear"
    zle accept-line
  }
  zle -N ctrl_n
  bindkey "^n" ctrl_n

# LS
  function ctrl_e() {
    BUFFER="ls -l"
    zle accept-line
  }
  zle -N ctrl_e
  bindkey "^e" ctrl_e

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
