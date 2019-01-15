" ==============================================================================
"        ____                  _   _     _                          
"       |  _ \ _   _ _   _  __| | | |   (_)_ __  ___ ___  ___ _ __  
"       | |_) | | | | | | |/ _` | | |   | | '_ \/ __/ __|/ _ \ '_ \ 
"       |  _ <| |_| | |_| | (_| | | |___| | | | \__ \__ \  __/ | | |
"       |_| \_\\__,_|\__,_|\__,_| |_____|_|_| |_|___/___/\___|_| |_|
"                                                                   
" ==============================================================================

" ==============================================================================
" Plugins {{{
" ==============================================================================
call plug#begin('~/.config/nvim/plugged')   " Start plugin list

" Theme
Plug 'morhetz/gruvbox'                      " Gruvbox theme for airlin 

" Nerd tree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " File explorer

" Fuzzy
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
Plug 'junegunn/fzf.vim'                     " Fuzzy file finder

" Motions etc.
Plug 'tpope/vim-commentary'                 " Comment out (gc)
Plug 'tpope/vim-surround'                   " Adds surround motions

" Gitgutter
Plug 'airblade/vim-gitgutter'               " Adds symbols for changed lines

" Airline
Plug 'vim-airline/vim-airline'              " Airline
Plug 'vim-airline/vim-airline-themes'       " Airline themes

" Autocompletion
Plug 'Valloric/YouCompleteMe'

" Linting
Plug 'w0rp/ale'                             " Linting

call plug#end()                             " End the plugins list
" }}}

" ==============================================================================
" General settings {{{
" ==============================================================================
set encoding=utf8                           " Use UTF encoding
set autoread                                " Reload changed files
set backspace=indent,eol,start              " Allow backspace in insert
set mouse=a                                 " All modes have mouse support
set updatetime=25                           " Update time for example for gutter
let loaded_matchparen=1                     " Avoid loading plugin  
set history=1000                            " Set history to 1000
set magic                                   " Magic for regex
set clipboard=unnamed                       " Unnamed clipboard
filetype plugin indent on                   " Reset filetype detection

" Wildmenu commands
set wildmenu                                " Command completion
set wildmode=list:longest                   " Complete till longest common str

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

" Cursor
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,

" Scroll offset
set scrolloff=5                             " Offset from beginning and end 

" Linebreaking
set textwidth=0                             " Vim text width (break on overflow)
set linebreak                               " Wrap lines at convenient points

" Latex support
let g:tex_flavor='latex'

" Python paths
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
" }}}

" ==============================================================================
" Plugin settings {{{
" ==============================================================================

" GitGutter
let g:gitgutter_sign_added = '▶'
let g:gitgutter_sign_modified = '▶'
let g:gitgutter_sign_removed = '▶'
let g:gitgutter_sign_modified_removed = '▶'

" FZF
let g:fzf_layout = { 'down' : '~25%' }      " Fuzzy layout height

" NERDTree
let g:NERDTreeQuitOnOpen=0                  " Don't quit on open file
let NERDTreeShowHidden=1                    " Show hidden files (dotfiles)
let g:NERDTreeWinSize=31
let NERDTreeIgnore = ['\.pyc$']

" Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = ''

let g:airline#extensions#whitespace#checks = []

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'



" Ale Linting
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
" }}}

" ==============================================================================
" GUI {{{
" ==============================================================================
syntax enable                               " Use syntax highlighting
let showtabline=1                           " Do not show default tabline

" Status bar
set laststatus=2                            " Always statusbar

" Tab and whitespace characters
set listchars=tab:▸\ ,eol:¬                 " Tab or whitespace characters

" Line options
set cc=80                                   " Max line width
set number                                  " Show line number
set relativenumber                          " Relative numbers
set numberwidth=2                           " The number width for the ruler
set ruler                                   " Show cursor pos all the time
set cursorline                              " Enable current linenumber
set colorcolumn=81                          " set column overflow at 81

" Seperator symbol removed
set fillchars+=vert:\ 

" Colors
set background=dark                         " Set background to dark
colorscheme gruvbox                         " Use this theme
set t_Co=256                                " Use 256 colors

" Transparent background
hi Normal ctermbg=none

" GitGutter
hi GitGutterAdd ctermbg=106 ctermfg=106
hi GitGutterChange ctermbg=66 ctermfg=66
hi GitGutterDelete ctermbg=124 ctermfg=124
" }}}

" ==============================================================================
" Indentation {{{
" ==============================================================================
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

" ==============================================================================
" Autogroups {{{
" ==============================================================================
augroup configgroup
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    " Auto source vim
    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    autocmd BufWritePost .vimrc.local source %
    " Auto xrdb .Xresources
    autocmd BufWritePost .Xresources !xrdb %
    " Cursor when closing nvim
    autocmd VimLeave * call system('printf "\e[5 q" > $TTY')
    " On focus lost or gained 
    autocmd FocusLost * silent! wa
    " Latex
    autocmd FileType tex setlocal tw=79 wrap spell
    " Close preview window on insert leave
    autocmd InsertLeave * :pc
augroup end

" }}}

" ==============================================================================
" Mappings {{{
" ==============================================================================

" Map leader
let mapleader= ','                          " Set the mapleader
let maplocalleader= '\'                     " Local leader

" Map ; to :
nmap ; :

" Tab movement
noremap <silent> <leader>p :tabp<CR>        " Previous tab
noremap <silent> <leader>n :tabn<CR>        " Next tab

" Buffer list and movement
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" Lead quit or save
nnoremap <leader>q :q<CR>                   " Quit
nnoremap <leader>w :w<CR>                   " Write

" Scroll faster
nnoremap <C-e> 5<C-e>                       " Scroll 5 lines when C-e
nnoremap <C-y> 5<C-y>                       " Scroll 5 lines when C-y

" Edit vimrc
map <leader>v :e! ~/.config/nvim/init.vim<CR>

" Clear highlighted search using ESC
noremap <esc> :set hlsearch! hlsearch?<CR>

" Switch between current and last buffer
nmap <leader>. <c-^>

" Moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" Next when searching centers
nmap n nzz
nmap p pzz

" indenting keybinds
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Windows movement
nnoremap <silent><C-l> <C-w>l
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-h> <C-w>h

" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Fuzzy
nmap <silent> <leader>f :GFiles<CR>
nmap <silent> <leader>y :Files<CR>
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Easy align
xmap ga <Plug>(EasyAlign)                   " Visual mode
nmap ga <Plug>(EasyAlign)                   " Normal mode

" }}}
