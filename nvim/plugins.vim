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

" Lightline
Plug 'itchyny/lightline.vim'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" Vista
Plug 'liuchengxu/vista.vim'

" Autocomplete and linting
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': {-> coc#util#install()}}
Plug 'josa42/vim-lightline-coc'

" Vimtex
Plug 'lervag/vimtex'                        " Vimtex

" Rust support
Plug 'rust-lang/rust.vim'

" Vim-which-key
Plug 'liuchengxu/vim-which-key'

" Git commands
Plug 'tpope/vim-fugitive'

" Root to .git folders
Plug 'airblade/vim-rooter'

" Devicons
Plug 'ryanoasis/vim-devicons'

" Quick jump to search
Plug 'justinmk/vim-sneak'

" Vimspector
Plug 'puremourning/vimspector'

call plug#end()                             " End the plugins list
" }}}
