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
set updatetime=50 " Shorter update time
set shortmess+=c " Don't pass messages to ins-completion-menu
set cursorline " Enable highlighting for current line of code
set laststatus=2 " Always display status bar

" Config Statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ')
endfunction

set statusline=
set statusline+=%#DiffChange#
set statusline+=%{StatuslineGit()}
set statusline+=%#StatusLineNC#
set statusline+=\ %f
set statusline+=%m
set statusline+=\ %y
set statusline+=%=
set statusline+=%#healthError#
set statusline+=%{StatusDiagnostic()}
set statusline+=%#StatusLineNC#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'shime/vim-livedown'
Plug 'sunaku/vim-dasht'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-commentary'
Plug 'wakatime/vim-wakatime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo'
Plug 'voldikss/vim-floaterm'
Plug 'vimwiki/vimwiki'

Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

Plug 'morhetz/gruvbox'

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

colorscheme gruvbox
set background=dark
let g:gruvbox_italic=1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1

highlight clear SignColumn
highlight Comment cterm=italic gui=italic

if executable('rg')
  let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

" -- netrw settings
let g:netrw_browse_split = 2
let g:netrw_banner = 0
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

let g:fzf_layout = { 'down': '~40%' }

map [q :cprev<CR>
map ]q :cnext<CR>

" quickscope settings
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline
let g:qs_max_chars=150

"vim TODO
nmap <leader>tu <Plug>BujoChecknormal
nmap <leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

let g:closetag_filetypes = 'javascriptreact'

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pe :Files<CR>
nnoremap <leader>pr :Rg<SPACE>
nnoremap <leader>gxf :FloatermNew --name=
nnoremap <leader>gxb :FloatermNew --height=0.8 --width=0.8 --name=
nnoremap <leader>gxe :FloatermShow 
nnoremap <leader>gxt :60vs<CR>:term<CR>
nnoremap <leader>ge :CocList diagnostics<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <silent> <leader>gpo :Git push origin --all<CR>:echo "Origin push complete"<CR>
nnoremap <silent> <Left> :vertical resize +10<CR>
nnoremap <silent> <Right> :vertical resize -10<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d

inoremap <C-c> <ESC>
inoremap jj <ESC>

cnoremap <C-c> <ESC>
cnoremap jj <ESC>

tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" Dasht Mappings
let g:dasht_results_window = 'vnew'

nnoremap <leader>kc :Dasht<Space>
nnoremap <leader>ka :Dasht!<Space>
nnoremap <silent> <leader>KC :call Dasht([expand('<cword>'), expand('<cWORD>')])<Return>
nnoremap <silent> <leader>KA :call Dasht([expand('<cword>'), expand('<cWORD>')], '!')<Return>
vnoremap <silent> <leader>KC y:<C-U>call Dasht(getreg(0))<Return>
vnoremap <silent> <leader>KA y:<C-U>call Dasht(getreg(0), '!')<Return>

" Floaterm Mappings
let g:floaterm_keymap_new    = '<F5>'
let g:floaterm_keymap_prev   = '<F6>'
let g:floaterm_keymap_next   = '<F7>'
let g:floaterm_keymap_toggle = '<F8>'

" Vimwiki Config
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'auto_diary_index': 1}]

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
  \ 'coc-phpls',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-vetur',
  \ 'coc-json',
  \ 'coc-highlight',
  \ ]

inoremap <buffer> <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
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

" Vim autocmd
augroup toggle_relative_number
  au!
  autocmd InsertEnter * :setlocal norelativenumber
  autocmd InsertLeave * :setlocal relativenumber
augroup END
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
augroup cmdline
  au!
  autocmd CmdlineLeave : echo ''
augroup end
augroup filetypedetect
  au BufRead,BufNewFile *.{js,jsx,ts,tsx,mjs} set filetype=typescriptreact
augroup END
autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
autocmd BufWritePre * :call TrimWhitespace()
