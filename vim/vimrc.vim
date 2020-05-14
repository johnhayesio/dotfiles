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
set path+=**
set wildignore=*/node_modules/*,*.git*

" Numbers
set relativenumber
set numberwidth=5

" Enable autocompletion
set wildmenu
set wildmode=longest:full,full
set completeopt+=menuone,noinsert,noselect,preview

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

" Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

function! CloseNetrw()
  let i = bufnr("$")
  while (i >= 1)
    if (getbufvar(i, "&filetype") == "netrw")
      silent exe "bwipeout " . i
    endif
    let i-=1
  endwhile
endfunction

autocmd BufWinEnter * call CloseNetrw()

" Set mapleader - ;
let mapleader = ";"

" Quicker window movement
nnoremap <space>j <C-w>j
nnoremap <space>k <C-w>k
nnoremap <space>h <C-w>h
nnoremap <space>l <C-w>l
nnoremap <space>? <C-w><C-r>

" Remap Escape to jk
inoremap jk <ESC>
cnoremap jk <ESC>

" Remaps
nnoremap <leader>r :set ft=javascriptreact<CR>
vnoremap <leader>r :set ft=javascriptreact<CR>
nnoremap <leader>o :Find<CR>
vnoremap <leader>o :Find<CR>
nnoremap <leader>e :Files<CR>
vnoremap <leader>e :Files<CR>
nnoremap <leader>vi :Vifm<CR>
nnoremap <leader>vd :DiffVifm<CR>
inoremap <leader>w <Esc>:w<CR>:echo "Filed saved."<CR>
nnoremap <leader>w :w<CR>:echo "File saved."<CR>
inoremap <leader>q <ESC>:q!<CR>
nnoremap <leader>q :q!<CR>
inoremap <leader>x <ESC>:x<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>l :Buffers<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>b :BufOnly<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>fh <ESC>ggVG
vnoremap <leader>cc :w !pbcopy<CR><CR>:echo "Text copied to clipboard."<CR>
nnoremap <leader>cp :r !pbpaste<CR><CR>:echo "Text pasted from clipboard."<CR>
nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <leader>= :wincmd =<CR>
nnoremap <leader>gc :Silent screen -x client<CR>
nnoremap <leader>gs :Silent screen -x server<CR>
nnoremap <leader>gl :Silent lazygit<CR>
nnoremap <leader>ge :CocList diagnostics<CR>
nnoremap <space>gs :G<CR>
nnoremap <space>gc :Git commit -v<CR>
nnoremap <space>gf :diffget //2<CR>
nnoremap <space>gh :diffget //3<CR>
nnoremap <space>gv :GV<CR>
nnoremap <space>gb :Git blame<CR>
nnoremap <space>gd :Git diff<CR>
nnoremap <space>gp :Git push origin --all<CR>
nnoremap <space>gg :Git push gitlab --all<CR>
nnoremap <space>ga :Git push gitlab --all<CR>:Git push origin --all<CR>
nnoremap <leader>ff :Prettier<CR>
nnoremap <leader>, :noh<CR>:echo "Search Cleared"<CR>
nmap <space>gj <plug>(signify-next-hunk)
nmap <space>gk <plug>(signify-prev-hunk)
nnoremap <leader><leader> <C-^>
vnoremap <leader><leader> <C-^>

" Spellcheck
nnoremap <leader>m :hi SpellBad cterm=underline,bold ctermfg=red<CR>:echo "Spellcheck turned on."<CR>
nnoremap <C-m> :hi clear SpellBad<CR>:echo "Spellcheck turned off."<CR>

" Resize panes easily
nnoremap <silent> <Left> :vertical resize +5<CR>
nnoremap <silent> <M-l> :vertical resize +5<CR>
nnoremap <silent> <Right> :vertical resize -5<CR>
nnoremap <silent> <M-h> :vertical resize -5<CR>
nnoremap <silent> <Up> :resize +5<CR>
nnoremap <silent> <M-k> :resize +5<CR>
nnoremap <silent> <Down> :resize -5<CR>
nnoremap <silent> <M-j> :resize -5<CR>

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

" Default 4000 leads to noticeable delays and poor user experience
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Gitlab for fugitive GBrowse
let g:fugitive_gitlab_domains = ['https://my.gitlab.com']

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
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'junegunn/gv.vim'

Plug 'jparise/vim-graphql' " GraphQL Syntax
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
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
  \ 'coc-explorer',
  \ 'coc-snippets',
  \ 'coc-emmet',
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
nmap <buffer> <leader>gd <Plug>(coc-definition)
nmap <buffer> <leader>gy <Plug>(coc-type-definition)
nmap <buffer> <leader>gi <Plug>(coc-implementation)
nmap <buffer> <leader>gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)
nnoremap <buffer> <leader>cr :CocRestart<CR><CR>

" Use K to show documentation in preview window
nnoremap <silent>gk :call <SID>show_documentation()<CR>

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

" Explorer
nmap <space>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

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
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!node_modules" --glob "!.git" --glob "!.meteor" --glob "!package-lock.json" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Vim autocmd
autocmd BufWritePre * :call TrimWhitespace()
