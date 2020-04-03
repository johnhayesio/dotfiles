" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
	call plug#begin('~/.vim/plugged')
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'bling/vim-airline'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'wakatime/vim-wakatime'
  Plug 'airblade/vim-gitgutter'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'vifm/vifm.vim'
  Plug 'tpope/vim-surround'
  Plug 'junegunn/goyo.vim'
  Plug 'SirVer/ultisnips'
  Plug 'mlaursen/vim-react-snippets'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
" Initialize plugin system
  call plug#end()

" Enter the current millenium
  set nocompatible

" Enable syntax and plugins
	syntax on
	filetype plugin indent on
  set background=dark
  set term=xterm-256color
  set termguicolors
  set t_Co=256
  let g:palenight_terminal_italics=1
  let g:airline_theme = "palenight"
  colorscheme palenight
  set guifont=Dank\ Mono
  highlight Normal ctermbg=None
  highlight Comment cterm=italic
  highlight Search cterm=underline,bold ctermfg=red
  highlight Folded cterm=bold ctermfg=lightblue

" Leader - (;)
	let mapleader=";"

" Vim general settings
	set backspace=indent,eol,start
	set autoindent
	set dir=/tmp/
	set nobackup
  set encoding=UTF-8
  set showcmd

" Numbers	
	set number
  set numberwidth=5
  set relativenumber

" Enable autocompletion
  set wildmode=longest,list,full

" Softtabs, 2 spaces
  set smartindent
	set tabstop=2
	set shiftwidth=2
	set shiftround
	set expandtab
  set linebreak

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
  
" Scrolling
	set scrolloff=8
	set sidescrolloff=15
	set sidescroll=1

" Make searching better
	set gdefault
	set ignorecase
	set smartcase
	set hlsearch
	set incsearch
	set showmatch
	nnoremap <silent> <leader>, :noh<CR>
	nnoremap <C-u> :nohl<CR>:echo "Search Cleared"<CR>
  nnoremap <C-c> :set norelativenumber<CR>:set nonumber<CR>:echo "Line numbers turned off."<CR>
  nnoremap <C-n> :set relativenumber<CR>:set number<CR>:echo "Line numbers turned on."<CR>

" Netrw settings
  let g:netrw_banner = 0
  let g:netrw_liststyle = 1
  let g:netrw_sort_by = "exten"
  
" Quicker window movement
	nnoremap <leader>j <C-w>j
	nnoremap <leader>k <C-w>k
	nnoremap <leader>h <C-w>h
	nnoremap <leader>l <C-w>l
" " <c-h> is interpreted as <bs> in neovim
" " This is a bandaid fix until the team decides how
" " they want to handle fixing
" it...(https://github.com/neovim/neovim/issues/2048)
	nnoremap <silent> <bs> :TmuxNavigateLeft<CR>

" Navigation within find
	nnoremap n nzzzv
	nnoremap N Nzzzv

" Spellcheck
  nnoremap <leader>m :hi SpellBad cterm=underline,bold ctermfg=red<CR>:echo "Spellcheck turned on."<CR>
  nnoremap <C-m> :hi clear SpellBad<CR>:echo "Spellcheck turned off."<CR>
  map <F6> :set spelllang=en_us<CR>:echo "Spellcheck lang set to EN_US."<CR>
  map <F7> :set spelllang=ru<CR>:echo "Spellcheck lang set to RU."<CR>

" Distraction-free writing
  nnoremap <leader>y :Goyo 120 \| set linebreak<CR>
  nnoremap <C-y> :Goyo!<CR>

"	nnoremap H 0
"	nnoremap L $
"	nnoremap J G
"	nnoremap K gg

" Set wildmenu
  set wildmenu

" Remap Escape to jk
  inoremap jk <ESC>

" Use tab to jump between blocks
	nnoremap <tab> %
	vnoremap <tab> %

	nnoremap <leader>z zMzvzz

	nnoremap vv 0v$

  "Expanding tabs on edit
  inoremap <leader><CR> <CR><C-o>==<C-o>O 

" Display extra white space
	set listchars=tab:\|\
  nnoremap <leader><tab> :set list<CR>:echo "White space characters turned on."<CR>
  nnoremap <C-i> :set nolist<CR>:echo "White space characters turned off."<CR>

" Always use vertical diffs
	set diffopt+=vertical

" Allow mouse usage
	set ttyfast
	set mouse=a

" Save text folding
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview

" Language Specific
" General
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

" File and Window Management 
	inoremap <leader>w <Esc>:w<CR>:echo "Filed saved."<CR>
	nnoremap <leader>w :w<CR>:echo "File saved."<CR>

	inoremap <leader>q <ESC>:q!<CR>
	nnoremap <leader>q :q!<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>t :tabnew<CR>:Files<CR>
	nnoremap <leader>v :vsplit<CR>:Files<CR>
	nnoremap <leader>s :split<CR>:Files<CR>
  nnoremap <leader>p :tabp<CR>
  nnoremap <leader>n :tabn<CR>

  " Vifm commands
	nnoremap <leader>e :Vifm<CR>
  nnoremap <leader>d :DiffVifm<CR>

  " Silence bash commands
  command! -nargs=1 Silence execute ':silent !'.<q-args> | execute ':redraw!'

" Copy paste to/from clipboard
  nnoremap <leader>fs <ESC>ggVG
  vnoremap <leader>c :w !pbcopy<CR><CR>:echo "Text copied to clipboard."<CR>
  nnoremap <leader>r :r !pbpaste<CR><CR>:echo "Text pasted from clipboard."<CR>

" Zoom a Vim pane, <C-w>= to re-balance
	nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>
	nnoremap <leader>= :wincmd =<CR>

" Resize panes
	nnoremap <silent> <Right> :vertical resize -5<CR>
	nnoremap <silent> <Left> :vertical resize +5<CR>
	nnoremap <silent> <Up> :resize -5<CR>
	nnoremap <silent> <Down> :resize +5<CR>

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

" Prettier command for coc
  command! -nargs=0 Prettier :CocCommand prettier.formatFile
  nnoremap <leader>ff :Prettier<CR>

" Open markdown in Marked
  command! Marked silent !open -a "Marked 2.app" "%:p" 

" FZF settings
  nnoremap <leader>o :Files<CR>
  nnoremap <leader>g :Rg<CR>

" Remove trailing white space
  nnoremap <leader>b :%s/\s\+$//e

" coc config
  let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-emmet',
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

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

" Handle buffers
  nnoremap <leader>B :ls<CR>
  nnoremap <leader>C :%bd\|e#\|bd#<CR>
  nnoremap <leader>V :vert sb
  nnoremap <leader>H :sb 
  nnoremap <leader>N :bn<CR>
  command! BufOnly silent! execute "%bd|e#|bd#"

" Use K to show documentation in preview window
  nnoremap <silent> dC :call <SID>show_documentation()<CR>

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
  xmap <leader>u  <Plug>(coc-format-selected)
  nmap <leader>u  <Plug>(coc-format-selected)

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
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Tabline
  set tabline=%!MyTabLine()

  function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
      " select the highlighting
      if i + 1 == tabpagenr()
        let s .= '%#TabLineSel#'
      else
        let s .= '%#TabLine#'
      endif
  
      " set the tab page number (for mouse clicks)
      let s .= '%' . (i + 1) . 'T' 
  
      " the label is made by MyTabLabel()
      let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor
  
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
  
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1 
      let s .= '%=%#TabLine#%999Xclose'
    endif
  
    return s
  endfunction
  
  function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let label =  bufname(buflist[winnr - 1]) 
    return fnamemodify(label, ":t") 
  endfunction

" Future stuff
	" Swap line
	" Insert blank below and above
