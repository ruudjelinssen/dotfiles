" ==============================================================================
" Whichkey {{{
" ==============================================================================

" Map leader to whichkey
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey ','<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual ','<CR>

" Create a new map
let g:which_key_map = {}

" The separator
let g:which_key_sep = '→'

" nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>
" let g:which_key_map['?'] = 'search word'

" Floating windows or just window at the bottom
let g:which_key_use_floating_win = 0

let g:which_key_map['1'] = 'which_key_ignore'
let g:which_key_map['1'] = 'which_key_ignore'
let g:which_key_map['2'] = 'which_key_ignore'
let g:which_key_map['3'] = 'which_key_ignore'
let g:which_key_map['4'] = 'which_key_ignore'
let g:which_key_map['5'] = 'which_key_ignore'
let g:which_key_map['6'] = 'which_key_ignore'
let g:which_key_map['7'] = 'which_key_ignore'
let g:which_key_map['8'] = 'which_key_ignore'
let g:which_key_map['9'] = 'which_key_ignore'

" Root menu
let g:which_key_map['.'] = [ '<C-^>'                            , 'last buffer' ]
let g:which_key_map['l'] = [ ':bnext'                           , 'next buffer' ]
let g:which_key_map['h'] = [ ':bprevious'                       , 'previous buffer' ]
let g:which_key_map['d'] = [ ':bd'                              , 'close buffer' ]
let g:which_key_map['v'] = [ ':e! ~/.config/nvim/init.vim'      , 'edit vimrc' ]
let g:which_key_map['f'] = [ ':Files'                           , 'search files' ]

let g:which_key_map.s = {
    \ 'name': '+search',
    \ 'g': [':GFiles',                  'git files'],
    \ 'r': [':Rg',                      'ripgrep'],
    \ 's': [':CocFzfList symbols',      'symbols'],
    \ 'b': [':Buffers',                 'buffers'],
    \}

" Register which key map
call which_key#register(',', "g:which_key_map")

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function
" }}}
