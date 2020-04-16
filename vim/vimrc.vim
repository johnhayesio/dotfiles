" Enter the current millenium
set nocompatible

" Enable syntax and plugins
syntax on
filetype plugin indent on
let g:sneak#label = 1

" Vim general settings
set hidden
set backspace=indent,eol,start
set autoindent
set dir=/tmp/
set nobackup
set nowritebackup
set encoding=UTF-8
set showcmd

" Find files by name
set path=$PWD/**

" Numbers
set relativenumber
set numberwidth=5

" Enable autocompletion
set wildmenu
set wildmode=longest:full,full
set completeopt+=menuone,noinsert,noselect

" Softtabs, 2 spaces
set smartindent
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set linebreak

" Set defaults
set history=1000
set undolevels=1000
set noerrorbells

" Open new split panes to right and bottom
set splitbelow
set splitright

" Auto resize Vim splits to active split
set winwidth=110
set winheight=999
set winminwidth=5
set winminheight=5

" Make search better
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Remap Escape to jk
inoremap jk <ESC>

" Use tab to jump between blocks
nnoremap <tab> %
vnoremap <tab> %

" Always use vertical diffs
set diffopt+=vertical

" Allow mouse usage
set ttyfast
set mouse=a

" Save text folding
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Resize panes easily
nnoremap <silent> <Right> :vertical resize -5<CR>
nnoremap <silent> <Left> :vertical resize +5<CR>
nnoremap <silent> <Up> :vertical resize -5<CR>
nnoremap <silent> <Down> :vertical resize +5<CR>

" Short commands
nnoremap <silent>gl :bn<CR>
nnoremap <silent>gh :bp<CR>
nnoremap <silent>gb :buffers<CR>
nnoremap <silent>gt :tabnew<CR>
nnoremap <silent>gn :tabn<CR>
nnoremap <silent>gp :tabp<CR>
nnoremap <silent>go :Files<CR>
nnoremap <silent>gx :Rg<CR>
nnoremap <silent>gv :vsplit<CR>
nnoremap <silent>gs :split<CR>
nnoremap <silent>ga :Silent screen -x server<CR>

" Default 4000 leads to noticeable delays and poor user experience
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Enter plugins
call plug#begin('~/.vim/plugged')

Plug 'drewtempelmeyer/palenight.vim'
Plug 'bling/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'wakatime/vim-wakatime'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'mkitt/tabline.vim'
Plug 'justinmk/vim-sneak'
Plug 'wincent/vcs-jump'
Plug 'jparise/vim-graphql' " GraphQL Syntax
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

call plug#end()

set background=dark
set term=xterm-256color
set termguicolors
set t_Co=256
let g:palenight_terminal_italics=1
let g:airline_theme="palenight"
colorscheme palenight
set guifont=Dank\ Mono
highlight Normal ctermbg=none
highlight Comment cterm=italic
highlight Search cterm=underline,bold ctermfg=red
highlight Folded cterm=bold ctermfg=lightblue

" Coc config
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Coc for all files excluding typescript
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-emmet',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

inoremap <buffer> <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <buffer> <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <buffer> <silent>gd <Plug>(coc-definition)
nmap <buffer> <silent>gy <Plug>(coc-type-definition)
nmap <buffer> <silent>gi <Plug>(coc-implementation)
nmap <buffer> <silent>gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)
nnoremap <buffer> <silent>cr :CocRestart

" Use K to show documentation in preview window
nnoremap <silent> gk :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup mygroup
  autocmd!
" Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Trim whitespace pre-save
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

" Vim commands
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
command! Marked silent !open -a "Marked 2.app" "%:p"
command! RemoveWhite silent! execute "%s/\s\+$//e"
command! BufOnly silent! execute "%bd|e#|bd#"

" Format files with Prettier
nnoremap <silent>gq :Prettier<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Vim autocmd
autocmd BufWritePre * :call TrimWhitespace()
