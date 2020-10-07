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
source $HOME/.config/nvim/plugin-config/vista.vim
source $HOME/.config/nvim/plugin-config/lightline.vim
source $HOME/.config/nvim/plugin-config/coc.vim
source $HOME/.config/nvim/plugin-config/fzf.vim
source $HOME/.config/nvim/plugin-config/sneak.vim

" TODO: fix for operator background on selected line
hi! link Operator GruvboxFg1
" }}}

" ==============================================================================
" Mappings {{{
" ==============================================================================
" Fuzzy
nmap <silent> <leader>y :GFiles<CR>
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" }}}

" ==============================================================================
" Coc mappings {{{

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


" }}}
