" ==============================================================================
" Autogroups {{{
" ==============================================================================
augroup configgroup
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    " Auto source vim
    autocmd! BufWritePost *.vim source $HOME/.config/nvim/init.vim
    " autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    " autocmd BufWritePost .vimrc.local source %
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
