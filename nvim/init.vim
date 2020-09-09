" ==============================================================================
"        ____                  _   _     _                          
"       |  _ \ _   _ _   _  __| | | |   (_)_ __  ___ ___  ___ _ __  
"       | |_) | | | | | | |/ _` | | |   | | '_ \/ __/ __|/ _ \ '_ \ 
"       |  _ <| |_| | |_| | (_| | | |___| | | | \__ \__ \  __/ | | |
"       |_| \_\\__,_|\__,_|\__,_| |_____|_|_| |_|___/___/\___|_| |_|
"                                                                   
" ==============================================================================


" ==============================================================================
" Imports {{{
" ==============================================================================
" Plugins
source $HOME/.config/nvim/plugins.vim

" General
source $HOME/.config/nvim/general/autogroups.vim
source $HOME/.config/nvim/general/general.vim
source $HOME/.config/nvim/general/gui.vim

" Keys
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/whichkey.vim

" Plugin configs
source $HOME/.config/nvim/plugin-config/airline.vim
source $HOME/.config/nvim/plugin-config/coc.vim
source $HOME/.config/nvim/plugin-config/fzf.vim
" }}}

" ==============================================================================
" Mappings {{{
" ==============================================================================
" Tab movement
noremap <silent> <leader>p :tabp<CR>        " Previous tab
noremap <silent> <leader>n :tabn<CR>        " Next tab

" Buffer list and movement
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>


" Edit vimrc
map <leader>v :e! ~/.config/nvim/init.vim<CR>


" Switch between current and last buffer
nmap <leader>. <c-^>

" Close buffer
nmap <leader>d :bd<CR>

" Fuzzy
nmap <silent> <leader>y :GFiles<CR>
nmap <silent> <leader>f :Files<CR>
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

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




" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


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


" Tab to trigger completion and confirm
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Notify coc on autopair
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" }}}
