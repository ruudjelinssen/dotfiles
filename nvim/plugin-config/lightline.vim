" ==============================================================================
" Lightline {{{
" ==============================================================================
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'gitbranch', 'filename' ],
    \             [ 'coc_ok', 'coc_errors', 'coc_warnings' ],
    \             [ 'method' ]],
    \   'right':[ ['lineinfo'],
    \             [ 'percent' ],[ 'coc_status', 'fileformat','fileencoding']  ]
    \ },
    \ 'component_function': {
    \   'filename': 'LightlineFile',
    \   'fileformat': 'LightlineFileformat',
    \   'gitbranch': 'LightlineFugitive',
    \   'method': 'NearestMethodOrFunction',
    \ },
    \ }

" register coc compoments:
call lightline#coc#register()

function! LightlineFugitive() 
    if exists('*FugitiveHead') 
        let branch = FugitiveHead() 
        return branch !=# '' ? ' '. branch : '' 
    endif 
    return '' 
endfunction 

function! LightlineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightlineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ""
    else
        return ""
    endif
endfunction

function! LightlineFilename()
    return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '') .
                \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFile() 
    let icon = (strlen(&filetype) ? '' . WebDevIconsGetFileTypeSymbol() : 'no ft') 
    let filename = LightlineFilename()
    let ret = [filename,icon]
    if filename == ''
        return ''
    endif
    return join([icon, filename],' ')
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" Show current method name in lightline
function! NearestMethodOrFunction() abort
  let l:method = get(b:, 'vista_nearest_method_or_function', '')
  if l:method != ''
    let l:method = ' ' . l:method 
  endif
  return l:method
endfunction

autocmd BufEnter * call vista#RunForNearestMethodOrFunction()

" }}}
