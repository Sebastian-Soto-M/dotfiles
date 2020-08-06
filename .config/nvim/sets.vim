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
let g:NERDTreeIgnore = ['^node_modules$']

let g:coc_global_extensions = [
            \ 'coc-actions',
            \ 'coc-css',
            \ 'coc-tabnine',
            \ 'coc-emmet',
            \ 'coc-eslint',
            \ 'coc-git',
            \ 'coc-godot',
            \ 'coc-html',
            \ 'coc-java',
            \ 'coc-json',
            \ 'coc-pairs',
            \ 'coc-prettier',
            \ 'coc-python',
            \ 'coc-snippets',
            \ 'coc-tag',
            \ 'coc-vimlsp',
            \ 'coc-xml',
            \ ]

" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=50
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show (Changed to auto, other opts: yes-no)
set signcolumn=auto

let g:coc_snippet_next='<tab>'
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:sort_motion_visual_block_command="Vissort"

set complete+=k

" Mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" WRAP TOGGLE
setlocal nowrap
noremap <silent> <Leader>tw :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction

let g:colorizer_auto_color=1
let g:colorizer_skip_comments=1
let g:colorizer_disable_bufleave=1
let g:colorizer_auto_filetype='scss,sass,css,html,md,config,conf'

" Sane defaults 
set noshowmode
set nu rnu
set smartcase
" Tabs & Spaces
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
" Backup
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
" Text & Braks
set textwidth=79
set breakindent
set cindent
set colorcolumn=80
set cursorline
set encoding=UTF-8
set fo-=t
set foldmethod=syntax
set nofoldenable
" Search
set hlsearch
set ignorecase
set incsearch

let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'
let g:formatdef_cstm_java='"astyle --mode=java --style=java"'
let g:formatters_java=['cstm_java']
let g:user_emmet_leader_key=','
let g:vim_markdown_folding_disabled=1
