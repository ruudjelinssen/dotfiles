" ==============================================================================
" General settings {{{
" ==============================================================================
set encoding=UTF-8                          " Use UTF encoding
set autoread                                " Reload changed files
set backspace=indent,eol,start              " Allow backspace in insert
set mouse=a                                 " All modes have mouse support
set updatetime=100                          " Update time for example for gutter
set timeoutlen=300                          " Default is 1000ms
set clipboard=unnamedplus                   " Copy between everything
let loaded_matchparen=1                     " Avoid loading plugin  
set history=1000                            " Set history to 1000
set magic                                   " Magic for regex
filetype plugin indent on                   " Reset filetype detection

" TextEdit might fail if hidden is not set.
set hidden

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Wildmenu commands
set wildoptions=pum,tagfile
set pumheight=10

" Searching
set hlsearch                                " Highlight search
set ignorecase                              " Ignore case sensitive in search
set incsearch                               " Incremental search
set smartcase                               " Smart case when searching
set nolazyredraw                            " Dont't redraw whil executing macros

" Backup
set nobackup                                " No backup
set noswapfile                              " No swap files
set nowritebackup                           " No write backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Undo folder
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" Statusbar
set showcmd                                 " Show incomplete commands
set showmode                                " Show current mode

" Split settings
set diffopt=vertical,filler                 " User vertical split when diff
set splitbelow                              " split down when splitted
set splitright                              " Split right when splitted vertically

" Folding
set foldmethod=syntax                       " Fold by syntax 
set foldlevel=1                             " Default fold level
set foldnestmax=10                          " Max fold nesting
set nofoldenable                            " Disable folding

" Autocomplete
set complete=.,w,b,u,t,i                    " Where to look for autocomplete
set completeopt=menu,preview                " How to display completion

" Scroll offset
set scrolloff=5                             " Offset from beginning and end 

" Linebreaking
set textwidth=0                             " Vim text width (break on overflow)
set linebreak                               " Wrap lines at convenient points

" Latex support
let g:tex_flavor='latex'

" Python paths
let g:python2_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Indentation
filetype indent on                          " Enable indentation plugin
filetype plugin indent on                   " Should fix some issues
set autoindent                              " Use auto indentation
set expandtab                               " Expand tabs to spaces
set shiftwidth=4                            " Indent is 4 spaces
set smartindent                             " Use smart indenting
set smarttab                                " Indent spaces instead of tabs
set softtabstop=4                           " One tab is four spaces
set tabstop=4                               " One tab is four spaces
" }}}
