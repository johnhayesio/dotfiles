" Enter the current millenium
set nocompatible

" Enable syntax and plugins (for netrw)
	syntax on
	filetype plugin indent on
  set term=xterm-256color
  colorscheme monokai
  set background=dark
  highlight Normal ctermbg=None

"Leader - (;)
	let mapleader=";"

 " Allow hidden files in NERDTree
  let NERDTreeShowHidden=1

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
	call plug#begin('~/.vim/plugged')
	Plug 'crusoexia/vim-monokai'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-surround'
  Plug 'kien/ctrlp.vim'
  Plug 'bling/vim-airline'
  Plug 'pangloss/vim-javascript'
  Plug 'othree/html5.vim'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" Initialize plugin system
  call plug#end()

" Vim general settings
	set backspace=indent,eol,start
	set autoindent
	set dir=/tmp/
	set nobackup

" Numbers	
	set number
  set numberwidth=5
  set norelativenumber

" Find files
	set path+=**

" Display all matching files
	set wildmenu
	set wildmode=list:longest,full
	set wildignore=*.swp,*.pyc,*.class

" Softtabs, 2 spaces
	set tabstop=2
	set shiftwidth=2
	set shiftround
	set expandtab

" Set defualts font
	set history=1000
	set undolevels=1000
	set cursorline
	set title
	set visualbell
	set noerrorbells
	hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

" Open new split panes to right and bottom, which  more natural
" set splitbelow
	set splitright

" Auto resize Vim splits to active split
	set winwidth=104
	set winheight=5
	set winminheight=5
	set winheight=999

" HTML Editing
	set matchpairs+=<:>

  " Emmet Tabbing
  imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Treat <li> and <p> tags like the block tags they are
	let g:html_indent_tags = 'li\|p'

" ================ Scrolling ========================
	set scrolloff=8
	set sidescrolloff=15
	set sidescroll=1

" Syntastic Settings
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

" Make searching better
	set gdefault
	set ignorecase
	set smartcase
	set hlsearch
	set incsearch
	set showmatch
	nnoremap <silent> <leader>, :noh<CR>
	nnoremap <C-u> :nohl<CR><C-u>:echo "Search Cleared"<CR>
	nnoremap <C-c> :set norelativenumber<CR>:set nonumber<CR>:echo "Line numbers turned off."<CR>
"	nnoremap <C-n> :set relativenumber<CR>:set number<CR>:echo "Line numbers turned on."<CR>

" Quicker window movement
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-h> <C-w>h
	nnoremap <C-l> <C-w>l
  map <C-n> :NERDTreeToggle<CR>
" " <c-h> is interpreted as <bs> in neovim
" " This is a bandaid fix until the team decides how
" " they want to handle fixing
" it...(https://github.com/neovim/neovim/issues/2048)
	nnoremap <silent> <bs> :TmuxNavigateLeft<cr>

" Navigation within find
	nnoremap n nzzzv
	nnoremap N Nzzzv

	nnoremap H 0
	nnoremap L $
	nnoremap J G
	nnoremap K gg

" Navigating with guides
	inoremap <Space><Space> <ESC>/<++><CR>"_c4l
	vnoremap <Space><Space> <ESC>/<++><CR>"_c4l
	map <Space><Space> <ESC>/<++><CR>"_c4l
	inoremap ;gui <++>

" Remap Escape to ee
	inoremap ee <ESC>

" Use tab to jump between blocks
	nnoremap <tab> %
	vnoremap <tab> %

	nnoremap <Space> za
	nnoremap <leader>z zMzvzz

	nnoremap vv 0v$

" Display extra white space
	set listchars=tab:\|\
  nnoremap <leader><tab> :set list!<cr>

" Always use vertical diffs
	set diffopt+=vertical

" Copy paste to/from clipboard
	set pastetoggle=<F2>
  nnoremap <leader>a <ESC>ggVG
  vnoremap <leader>c :w !pbcopy<CR><CR>

" Allow mouse usage
	set ttyfast
	set mouse=a

" Map Ctrl + S in any mode
	noremap <silent> <C-S>          :update<CR>
	vnoremap <silent> <C-S>         <C-C>:update<CR>
	inoremap <silent> <C-S>         <C-O>:update<CR>

" Map leader + s
	map <leader>S <C-S>

" Language Specific
	" General
		inoremap <leader>for <ESC>Ifor (int i = 0; i < <ESC>A; i++) {<enter>}<ESC>O<tab>
		inoremap <leader>if <ESC>Iif (<ESC>A) {<enter>}<ESC>O<tab>

  " HTML
    autocmd FileType html inoremap ;b <strong></strong><Space><++><ESC>FsT>i
		autocmd FileType html inoremap ;i <em></em><Space><++><ESC>FeT>i
		autocmd FileType html inoremap ;1 <h1></h1><CR><CR><++><ESC>2kf<i
		autocmd FileType html inoremap ;2 <h2></h2><CR><CR><++><ESC>2kf<i
		autocmd FileType html inoremap ;3 <h3></h3><CR><CR><++><ESC>2kf<i
		autocmd FileType html inoremap ;p <p></p><CR><CR><++><ESC>02kf>a
		autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Space><++><ESC>F"i
		autocmd FileType html inoremap ;ul <ul><CR><li></li><Space><++><CR></ul><CR><CR><++><ESC>03kf>a
		autocmd FileType html inoremap ;li <li></li><Space><++><ESC>FlT>i
		autocmd FileType html inoremap ;ol <ol><CR><li></li><Space><++><CR></ol><CR><CR><++><ESC>03kf>a

	" Java
		inoremap <leader>sys <esc>ISystem.out.println(<esc>A);
		vnoremap <leader>sys yOSystem.out.println(<esc>pA);

	" Java
		inoremap <leader>con <esc>Iconsole.log(<esc>A);
		vnoremap <leader>con yOconsole.log(<esc>pA);

	" C++
		inoremap <leader>cout <esc>Istd::cout << <esc>A << std::endl;
		vnoremap <leader>cout yOstd::cout << <esc>pA << std:endl;

	" C
		inoremap <leader>out <esc>Iprintf(<esc>A);<esc>2hi
		vnoremap <leader>out yOprintf(, <esc>pA);<esc>h%a

	" Typescript
		autocmd BufNewFile,BufRead *.ts set syntax=javascript
		autocmd BufNewFile,BufRead *.tsx set syntax=javascript

	" Markup
		inoremap <leader>< <esc>I<<esc>A><esc>yypa/<esc>O<tab>
		autocmd FileType markdown setlocal spell
		autocmd BufRead,BufNewFile *.md setlocal textwidth=100

	" Automatically wrap at 100 characters and spell check git commit messages
		autocmd FileType gitcommit setlocal textwidth=100
		autocmd FileType gitcommit setlocal spell

	" Allow styleshutocomplete hyphenated words
		autocmd FileType css,scss,sass,less setlocal iskeyword+=-

" File and Window Management 
	inoremap <leader>w <Esc>:w<CR>
	nnoremap <leader>w :w<CR>

	inoremap <leader>q <ESC>:q!<CR>
	nnoremap <leader>q :q!<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>e :Ex<CR>
	nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>
  nnoremap <leader>p :tabp<CR>
  nnoremap <leader>n :tabn<CR>

" Zoom a Vim pane, <C-w>= to re-balance
	nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
	nnoremap <leader>= :wincmd =<cr>

" Resize panes
	nnoremap <silent> <Right> :vertical resize +5<cr>
	nnoremap <silent> <Left> :vertical resize -5<cr>
	nnoremap <silent> <Up> :resize +5<cr>
	nnoremap <silent> <Down> :resize -5<cr>

" Switch between the last two files
	nnoremap <leader><leader> <c-^>
	
" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	augroup END

" Future stuff
	" Swap line
	" Insert blank below and above

