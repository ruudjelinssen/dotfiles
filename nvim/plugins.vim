" ==============================================================================
" Plugins {{{
" ==============================================================================
call plug#begin('~/.config/nvim/plugged')   " Start plugin list

" Gruvbox is nice
Plug 'morhetz/gruvbox'

" Fuzzy
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
Plug 'junegunn/fzf.vim'                     " Fuzzy file finder
Plug 'antoinemadec/coc-fzf'

" Motions etc.
Plug 'tpope/vim-commentary'                 " Comment out (gc)
Plug 'tpope/vim-surround'                   " Adds surround motions

" Airline
Plug 'vim-airline/vim-airline'              " Airline
Plug 'vim-airline/vim-airline-themes'       " Airline themes
Plug 'ryanoasis/vim-devicons'

" Autocomplete and linting
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': {-> coc#util#install()}}

" Vimtex
Plug 'lervag/vimtex'                        " Vimtex

" Rust support
Plug 'rust-lang/rust.vim'

" Vim-which-key
Plug 'liuchengxu/vim-which-key'

" Root to .git folders
Plug 'airblade/vim-rooter'

" Quick jump to search
Plug 'justinmk/vim-sneak'

call plug#end()                             " End the plugins list
" }}}
