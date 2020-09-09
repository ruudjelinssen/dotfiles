" ==============================================================================
" Mappings {{{
" ==============================================================================
" Map leader
let mapleader= ','                          " Set the mapleader
let maplocalleader= '\'                     " Local leader

" Map ; to :
nmap ; :

" Scroll faster
nnoremap <C-e> 5<C-e>                       " Scroll 5 lines when C-e
nnoremap <C-y> 5<C-y>                       " Scroll 5 lines when C-y

" Clear highlighted search using ESC
noremap <esc> :set hlsearch! hlsearch?<CR>

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
vnoremap > >gv
vnoremap < <gv

" TODO: fix this
imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" }}}
