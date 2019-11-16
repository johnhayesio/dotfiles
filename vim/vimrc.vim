" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
	call plug#begin('~/.vim/plugged')
	Plug 'morhetz/gruvbox'
  Plug 'crusoexia/vim-monokai'
  Plug 'bling/vim-airline'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-surround'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'scrooloose/nerdcommenter'
  "Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
" Initialize plugin system
  call plug#end()

" Enter the current millenium
  set nocompatible

" Enable syntax and plugins (for netrw)
	syntax on
	filetype plugin indent on
  set term=xterm-256color
  colorscheme gruvbox
  set background=dark
  let g:gruvbox_contrast_dark = 'hard'
  set guifont=Dank\ Mono
  highlight Normal ctermbg=None

"Leader - (;)
	let mapleader=";"

" NERDTree Settings
  "let NERDTreeShowHidden=1
  map <C-n> :NERDTreeToggle<CR>
  vmap ++ <plug>NERDCommenterToggle
  nmap ++ <plug>NERDCommenterToggle
  let g:NERDTreeIgnore = ['^node_modules$']

" sync open file with NERDTree
" Check if NERDTree is open or active
  function! IsNERDTreeOpen()        
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
  endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
  function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
      NERDTreeFind
      wincmd p
    endif
  endfunction

" Highlight currently open buffer in NERDTree
  autocmd BufEnter * call SyncTree()

" Prettier command for coc
  command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Ctrlp settings
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" coc config
  let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint', 
    \ 'coc-prettier', 
    \ 'coc-json', 
    \ ]
" from readme
" if hidden is not set, TextEdit might fail.
  set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

" always show signcolumns
  set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

" Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

" Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
  nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
" Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <C-d> <Plug>(coc-range-select)
  xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Vim general settings
	set backspace=indent,eol,start
	set autoindent
	set dir=/tmp/
	set nobackup

" Numbers	
	set number
  set numberwidth=5
  set relativenumber

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

" Set defaults font
	set history=1000
	set undolevels=1000
	set title
	set visualbell
	set noerrorbells

  set cursorline
	hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

" Open new split panes to right and bottom, which more natural
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
  "imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Treat <li> and <p> tags like the block tags they are
	let g:html_indent_tags = 'li\|p'

" Scrolling
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

" Remap Escape to jk
  inoremap jk <ESC>

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

