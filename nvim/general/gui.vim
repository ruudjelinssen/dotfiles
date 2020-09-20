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

" Cursor
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,
set guifont=PowerlineSymbols

" Colors
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

set background=dark
colorscheme gruvbox
hi Normal ctermbg=NONE

" Transparent background
" hi Normal ctermbg=none
" }}}
