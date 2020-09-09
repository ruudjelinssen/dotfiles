" ==============================================================================
" Plugins {{{
" ==============================================================================
call plug#begin('~/.config/nvim/plugged')   " Start plugin list

" Theme
Plug 'morhetz/gruvbox'                      " Gruvbox theme for airlin 

" Fuzzy
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
Plug 'junegunn/fzf.vim'                     " Fuzzy file finder

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

call plug#end()                             " End the plugins list
" }}}
