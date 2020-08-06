colorscheme dracula
set termguicolors
highlight CursorLine guibg=#44475A
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:lightline = {
            \ 'colorscheme': 'dracula',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified', 'blame' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'gitbranch#name',
            \   'blame': 'lightlinegitblame',
            \   'cocstatus': 'coc#status'
            \ },
            \ }

function! LightlineGitBlame() abort
    let blame = get(g:, 'coc_git_status', '')
    " return blame
    return winwidth(0) > 120 ? blame : ''
endfunction
