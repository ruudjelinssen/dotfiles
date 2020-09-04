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

" Auto pairs (brackets)
Plug 'jiangmiao/auto-pairs'                " Auto pairs

" Autocomplete and linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Rust support
Plug 'rust-lang/rust.vim'
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

" TextEdit might fail if hidden is not set.
set hidden

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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

" Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Coc
let g:coc_global_extensions = [
    \'coc-explorer',
    \'coc-snippets',
    \'coc-highlight',
    \'coc-markdownlint',
    \'coc-vimtex',
    \'coc-go',
    \'coc-python',
    \'coc-json', 
    \'coc-git',
    \'coc-clangd',
    \'coc-rls',
    \'coc-vimlsp',
    \]
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

" Scroll faster
nnoremap <C-e> 5<C-e>                       " Scroll 5 lines when C-e
nnoremap <C-y> 5<C-y>                       " Scroll 5 lines when C-y

" Edit vimrc
map <leader>v :e! ~/.config/nvim/init.vim<CR>

" Clear highlighted search using ESC
noremap <esc> :set hlsearch! hlsearch?<CR>

" Switch between current and last buffer
nmap <leader>. <c-^>

" Close buffer
nmap <leader>d :bd<CR>

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

" Fuzzy
nmap <silent> <leader>y :GFiles<CR>
nmap <silent> <leader>f :Files<CR>
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Easy align
xmap ga <Plug>(EasyAlign)                   " Visual mode
nmap ga <Plug>(EasyAlign)                   " Normal mode

" Tabline swithing
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" }}}

" ==============================================================================
" Coc mappings {{{
" ==============================================================================
nmap <C-n> :CocCommand explorer<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" }}}
