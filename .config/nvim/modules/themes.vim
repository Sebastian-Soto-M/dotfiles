colorscheme dracula
set termguicolors
highlight CursorLine guibg=#44475A
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:lightline = {
            \ 'colorscheme': 'dracula',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste', 'coc_errors', 'coc_warnings', 'coc_ok' ],[ 'gitbranch' ],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified', 'blame' ] ]
            \ },
            \ 'component_function': {
            \   'blame': 'lightlinegitblame',
            \   'cocstatus': 'coc#status'
            \ },                          
            \ 'component_type': {
            \   'gitbranch': 'tabsel',
            \ },                          
            \ 'component_expand': {
            \   'gitbranch': 'LightlineGitbranch',
            \ },
            \ 'separator': {'left': '', 'right': ''},
            \ }

call lightline#coc#register()

let g:gitbranch_icon = ''

function! LightlineGitbranch()
	let l:bname = gitbranch#name()
	return l:bname != '' ? g:gitbranch_icon . ' ' . l:bname : ''
endfunction

function! LightlineGitBlame() abort
    let blame = get(g:, 'coc_git_status', '')
    " return blame
    return winwidth(0) > 120 ? blame : ''
endfunction

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
            \ "Staged"    : "#0ee375",
            \ "Modified"  : "#d9bf91",
            \ "Renamed"   : "#51C9FC",
            \ "Untracked" : "#FCE77C",
            \ "Unmerged"  : "#FC51E6",
            \ "Dirty"     : "#FFBD61",
            \ "Clean"     : "#87939A",
            \ "Ignored"   : "#808080",
            \ }
