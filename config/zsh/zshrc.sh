################################################################################
#  _________  _   _    ____             __ _
# |__  / ___|| | | |  / ___|___  _ __  / _(_) __ _
#   / /\___ \| |_| | | |   / _ \| '_ \| |_| |/ _` |
#  / /_ ___) |  _  | | |__| (_) | | | |  _| | (_| |
# /____|____/|_| |_|  \____\___/|_| |_|_| |_|\__, |
#                                            |___/

# https://johnhayes.io personal zsh config
################################################################################

# New Session
  fortune -s computers | cowsay -f dragon | lolcat

# Source FZF
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Vars
	HISTFILE=~/.zsh_history
  HISTSIZE=555555
	SAVEHIST=555555
	setopt INC_APPEND_HISTORY # Save every command before it is executed
	setopt SHARE_HISTORY # Share history across all sessions
  setopt HIST_FIND_NO_DUPS # Only show one dup while cycling history
  setopt HIST_IGNORE_ALL_DUPS # Remove old dups and keep only the new one
  setopt HIST_SAVE_NO_DUPS # Do not save any dup commands to history
  setopt HIST_IGNORE_SPACE # Do not store commands started with a space

# Settings
  export VISUAL=nvim
  export EDITOR=nvim
	export HORS_ENGINE=stackoverflow
  export ANDROID_HOME=/Volumes/Expansion/Android/sdk
	export GOPATH=/Users/$USER/go
	export BROWSER=lynx
  export THE_WAY_GITHUB_TOKEN=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

  # FZF/FD Options
  export FD_OPTIONS="--follow --exclude .git --exclude node_modules"
  export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
  export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-j:preview-down,ctrl-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
  export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
  export FZF_CTRL_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

  # Android PATH Additions
  export PATH=$PATH:/Users/johnhayes/Library/Python/3.8/bin
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export PATH=$PATH:$HOME/dotfiles/config/utils

  source ~/dotfiles/config/zsh/plugins/fixls.zsh

# Aliases
  source ~/dotfiles/bash/aliasrc

# Scripts
  source ~/dotfiles/bash/scripts

# For Vim Mappings:
	stty -ixon

# ZSH/Oh-My-ZSH Plugins
  source ~/dotfiles/config/zsh/plugins/zsh-vim-mode.plugin.zsh
  source ~/dotfiles/config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  source ~/dotfiles/config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/dotfiles/config/zsh/plugins/oh-my-zsh/lib/history.zsh
  source ~/dotfiles/config/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
  source ~/dotfiles/config/zsh/plugins/oh-my-zsh/lib/completion.zsh

# ZSH Keybindings
  source ~/dotfiles/config/zsh/keybindings.sh

# Git Extras
  source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

# Cargo/Rust Source
  source $HOME/.cargo/env

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

# ZSH Prompt
  source ~/dotfiles/config/zsh/prompt.sh

# Zoxide/TheFuck initialization
  eval "$(zoxide init zsh)"
  eval "$(thefuck --alias)"
