# ```Dotfiles Config```

[![Patreon](https://img.shields.io/badge/-Patreon-red?logo=patreon&colorA=gray)](https://patreon.com/lifefullofchange) [![Ko-fi](https://img.shields.io/badge/-Buy%20me%20a%20coffee-orange?logo=ko-fi&logoColor=orange&colorA=gray)](https://ko-fi.com/lifefullofchange) [![Ask me anything!](https://img.shields.io/badge/Ask%20me-ANYTHING-1abc9c.svg)](https://github.com/johnhayesio/ama) ![GitHub Repo Size](https://img.shields.io/github/repo-size/johnhayesio/dotfiles) ![GitHub language count](https://img.shields.io/github/languages/count/johnhayesio/dotfiles) ![GitHub top language](https://img.shields.io/github/languages/top/johnhayesio/dotfiles) ![GitHub last commit](https://img.shields.io/github/last-commit/johnhayesio/dotfiles?color=red) [![Analytics](https://ga-beacon.appspot.com/UA-158277243-2/github.com/johnhayesio/dotfiles/README.md?pixel)](https://github.com/johnhayesio/dotfiles)

> Simple, but extensive customization of ZSH, TMUX, and Neovim.

## Setup Options

There's 3 ways in which you can use this, depending on how much you think you'll be customizing.

One of the key features is that this implementation stays in sync across all your machines. So depending on how much you'd like to customize your configuration, you have a few options:

* Little Customization: Just clone this repo and jump to [Installation](#installation).
* Mild Customization: [Fork]() this repo, and clone your own fork. Keep an eye on this repo for bug fixes and other improvements that you'd like to incorporate into your fork. Then jump to [Installation](#installation).
* Most Customization: Building your own dotfiles from scratch! Read through these docs and create your own dotfiles! You can add this repository as a [git module](https://git-scm.com/book/en/v2/Git-Tools-Submodules) and source the parts you like.

If you're unsure, just read the docs, clone this repository, and jump to [Installation](#installation).

## Installation

Once the repo is cloned, execute the deploy script:
```
./deploy
```

This script guides you through the following:

1. Checks to see if you have zsh, tmux, and neovim installed.
2. Installs it using your default package manager if you don't have it installed.
3. Checks to see if your default shell is zsh.
4. Sets zsh to your default shell.
5. Backs up your old configuration files.

Pretty convenient for configuring new servers.

# Summary of Changes

## Basic runtime operations

All default dotfiles (`.zshrc`, `init.vim`, etc) source something within the dotfiles repository. This helps separate changes that are synced across all your machines with system specific changes.

Upon launching a new shell, the first thing that's evaluated is `zshrc_manager.sh`. This script first launches tmux (optional). Then once zsh logs in, it updates the dotfiles repository, and sources the changes.

NOTE: If you wish to use tmux, remove # from the beginning of each these lines starting on the 2nd line in dotfiles/config/zsh/zshrc_manager.sh
```
# Run tmux if exists
if command -v tmux>/dev/null; then
	[ -z $TMUX ] && exec tmux
else
	echo "tmux not installed. Run ./deploy to configure dependencies"
fi
```

## [Zsh](https://en.wikipedia.org/wiki/Z_shell)

* `cd` has been reassigned to `cd` and `ls`. Every time you navigate to a new directory, it will display the contents of that directory.
* `v` has been aliased too: `nvim -p`. This let's you open multiple files in vim as tabs.

TIP: For better looking ls (with color), install [exa](https://github.com/ogham/exa) using your favorite package manager.

### Prompt

The prompt takes on the form:

```
[plugin, plugin, ...]:
```

Each plugin is sensitive to where you are and what you're doing, they reveal themselves when it's contextually relevant. Plugins include:

* `PWD plugin`: always present, tells you where you are. Always the first plugin.
* `Status code plugin`: appears anytime a program returns with a non-zero status code. Tells you what status code the program completed with.
* `Git plugin`: appears when you're in a git repository. Tells you what branch you're on, and how many files have been changed since the last commit.
* `Sudo plugin`: tells you when you can sudo without a password. Or when you're logged in as root.
* `Time plugin`: appears when a program took more than 1s to execute. Tells you how long it took to execute.
* `PID plugin`: appears when you background a task. Tells you what the PID of the task is.

### Keybindings
| Key Stroke | What It Does                                                 |
|------------|--------------------------------------------------------------|
| Ctrl-H     | Runs ``cd ~/``                                               |
| Ctrl-K     | Runs ``cd ..``                                               |
| Ctrl-N     | Runs ``clear``                                               |
| Ctrl-G     | Runs ``git add -A; git commit -v && git push``               |
| Ctrl-V     | Runs ``fc``. Takes last command and puts it in a vim buffer. |
| Ctrl-S     | Adds ``sudo`` to the beginning of the buffer.                |
| Ctrl-L     | Runs ``ls -l``.                                              |
| Ctrl-O     | Equivalent to hitting ``Enter``.                             |

### Plugins

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Searches your history while you type and provides suggestions.
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/tree/ad522a091429ba180c930f84b2a023b40de4dbcc): Provides fish style syntax highlighting for zsh.
* [ohmyzsh](https://github.com/robbyrussell/oh-my-zsh/tree/291e96dcd034750fbe7473482508c08833b168e3): Borrowed things like tab completion, fixing ls, tmux's vi-mode plugin.
* [vimode-zsh](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode) allows you to hit `esc` and navigate the current buffer using vim movement keys.

## [Neovim](https://neovim.io)

* Leader key has been remapped to `[space]`
* Plugins require [vim-plug](https://github.com/junegunn/vim-plug)

### Install vim-plug for Neovim using the below command based on your OS:
Unix, Linux
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
Linux (Flatpack)
```
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Windows (PowerShell)
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim" -Force
```

## [Tmux](https://en.wikipedia.org/wiki/Tmux)

* Ctrl-B has been remapped to the backtick character (&#96;). If you want to type the actual backtick character (&#96;) itself, just hit the key twice.
* `%` has been remapped to `v`.
* Use vim movement keys for moving between panes.
* Copy buffer is copied to xclip.
* Status bar tells you date, time, user, and hostname. Especially useful with nested ssh sessions.
