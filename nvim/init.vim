syntax on " Enable syntax highlighting
filetype plugin indent on " Enable indenting for files

set nocompatible " Use vim settings, not vi settings
set termguicolors " Enable true color support
set number " Enable line numbers
set relativenumber " Enable relative numbers
set hidden " Manage multiple buffers effectively
set autoindent " Enable auto-indenting
set softtabstop=2 " Indent by 2 spaces using tab
set shiftwidth=2 " Indent by 2 spaces when auto-indenting
set tabstop=2 " Show existing tab with 2 spaces
set expandtab " On pressing tab, insert 4 spaces
set backspace=indent,eol,start " Allow backspacing
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir " Set undo history directory
set noswapfile " Disable swap files
set nobackup " Disable backup files
set nowritebackup " Disable backup files during writing
set incsearch " Find the next match while typing search
set nohlsearch " Disable search highlighting
set noshowmatch " Disable match bracket highlighting
set wrap " Wrap words visually
set linebreak " Wrap only at breakat options
set smartcase " Ignore case while searching unless typing a capital letter
set history=1000 " Set larger history for executed commands
set noerrorbells " Disable beep on errors
set encoding=utf-8 " Use Unicode support
set mouse=a " Enable mouse for scrolling and resizing
set path+=** " Search current and all subdirectories using find command
set wildignore=*/node_modules/*,*.git* " Ignore node_modules and git directories using find command
set wildmenu " Display command line's tab as a menu
set wildmode=longest:full,full " Set wildmenu mode to full name
set splitbelow " Split panes to the bottom when opening
set splitright " Split panes to the right when opening
set cmdheight=2 " Give more space for displaying messages
set updatetime=50 " Shorter update time
set shortmess+=c " Don't pass messages to ins-completion-menu
set laststatus=2 " Always display status bar

" Config Statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#StatusLineNC#
set statusline+=\ %f
set statusline+=%m
set statusline+=\ %y
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'wakatime/vim-wakatime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/fzf.vim'

Plug 'drewtempelmeyer/palenight.vim'

Plug 'ThePrimeagen/vim-be-good'

call plug#end()

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

colorscheme palenight
let g:palenight_terminal_italics=1
set background=dark

if executable('rg')
  let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 15

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>r :set ft=javascriptreact<CR>
nnoremap <leader>pe :Files<CR>
nnoremap <leader>pr :Rg<SPACE>
nnoremap <leader>gxc :Silent screen -x client<CR>
nnoremap <leader>gxs :Silent screen -x server<CR>
nnoremap <leader>ge :CocList diagnostics<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader><leader> <C-^>
nnoremap <silent> <Left> :vertical resize +5<CR>
nnoremap <silent> <Right> :vertical resize -5<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d

inoremap <C-c> <ESC>
inoremap jk <ESC>

cnoremap jk <ESC>

" Coc Config
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = [
  \ 'coc-explorer',
  \ 'coc-snippets',
  \ 'coc-emmet',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-vetur',
  \ 'coc-json',
  \ ]

inoremap <buffer> <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <buffer> <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>gp <Plug>(coc-diagnostic-prev)
nmap <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart

nmap <space>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Trim whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"Vim commands
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
command! Marked silent !open -a "Marked 2.app" "%:p"

" Vim autocmd
autocmd BufWritePre * :call TrimWhitespace()
