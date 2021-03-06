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
set noshowmode " Disable mode when using lightline
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
set completeopt+=menuone,noinsert,noselect,preview " Set options for autocompletion
set splitbelow " Split panes to the bottom when opening
set splitright " Split panes to the right when opening
set winwidth=110 " Resize splits to active splits
set winheight=999 " Resize splits to active splits
set winminwidth=5 " Resize splits to active splits
set winminheight=5 " Resize splits to active splits
" set cmdheight=2 " Give more space for displaying messages
set updatetime=50 " Shorter update time
set shortmess+=cF " Don't pass messages to ins-completion-menu
set signcolumn=yes " Always show signcolumn
set laststatus=2 " Always display status bar
" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

call plug#begin('~/.vim/plugged')

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
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'

Plug 'drewtempelmeyer/palenight.vim'
Plug 'bling/vim-airline'

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

" --- vim airline settings
let g:airline_theme="palenight"
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }

colorscheme palenight
let g:palenight_terminal_italics=1
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

" Custom mappings
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>w :w<CR>:echo "File saved."<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>r :set ft=javascriptreact<CR>
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>pe :Files<CR>
nnoremap <leader>pf :Find<CR>
nnoremap <leader>pr :Rg<SPACE>
nnoremap <leader>gxc :Silent screen -x client<CR>
nnoremap <leader>gxs :Silent screen -x server<CR>
nnoremap <leader>gl :Silent lazygit<CR>
nnoremap <leader>ge :CocList diagnostics<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gp :Git push origin --all<CR>
nnoremap <leader>gg :Git push gitlab --all<CR>
nnoremap <leader>ga :Git push gitlab --all<CR>:Git push origin --all<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <leader>= :wincmd =<CR>
nnoremap <silent> <Left> :vertical resize +5<CR>
nnoremap <silent> <Right> :vertical resize -5<CR>
nnoremap <silent> <Up> :resize +5<CR>
nnoremap <silent> <Down> :resize -5<CR>
nnoremap <leader><leader> <C-^>
nnoremap <leader>, :noh<CR>:echo "Search Cleared"<CR>
nnoremap <tab> %
nnoremap <leader>c* *Ncgn
nnoremap <leader>c# #Ncgn
nnoremap <leader>cp :r !pbpaste<CR><CR>:echo "Text pasted from clipboard."<CR>

vnoremap <leader>cc :w !pbcopy<CR><CR>:echo "Text copied to clipboard."<CR>
vnoremap <tab> %
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d

inoremap <C-c> <esc>
inoremap jk <ESC>

cnoremap jk <ESC>

" Netrw Config
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

nmap <space>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Trim whitespace on save
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
autocmd BufWinEnter *.* silent loadview
autocmd BufWinLeave *.* mkview
autocmd User CocDiagnosticChange call lightline#update()
