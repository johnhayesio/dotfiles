# System Info
  pfetch

# Source FZF
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Vars
	HISTFILE=~/.zsh_history
  HISTSIZE=500000
	SAVEHIST=500000
	setopt inc_append_history # To save every command before it is executed
	setopt share_history # setopt inc_append_history

# Settings
  export VISUAL=nvim
  export EDITOR=nvim
	export HORS_ENGINE=stackoverflow
  export ANDROID_HOME=/Volumes/Expansion/Android/sdk
	export GOPATH=/Users/$USER/go
	export BROWSER=lynx

  # FZF/FD Options
  export FD_OPTIONS="--follow --exclude .git --exclude node_modules"
  export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
  export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-j:preview-down,ctrl-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
  export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
  export FZF_CTRL_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

  # Android PATH Additions
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
