time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

# Run tmux if exists
#if command -v tmux>/dev/null; then
#	[ -z $TMUX ] && exec tmux
#else
#	echo "tmux not installed. Run ./deploy to configure dependencies"
#fi

#(cd ~/dotfiles && time_out 3 git pull && time_out 3 git submodule update --init --recursive)
#(cd ~/dotfiles && git pull && git submodule update --init --recursive)
source ~/dotfiles/config/zsh/zshrc.sh
