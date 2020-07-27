" Install vim-plug if it isn't already
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" |---------|
" | Plugins |
" | Plugins |
call plug#begin('~/.config/nvim/plugged')
" Game
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
" Autocompletion
Plug 'mattn/emmet-vim'                  " New Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-surround'
" Tree
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'               " New Plugin
" Format
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"Plug 'christoomey/vim-titlecase'        " New Plugin
Plug 'christoomey/vim-sort-motion'      " New Plugin
Plug 'Chiel92/vim-autoformat'           " New Plugin 
Plug 'michaeljsmith/vim-indent-object'  " New Plugin
" Interface
Plug 'yuttie/comfortable-motion.vim'    " New Plugin
Plug 'chrisbra/Colorizer'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'majutsushi/tagbar'
"Plug 'ap/vim-buftabline'
Plug 'bananushka/taboo.vim'
Plug 'lepture/vim-jinja'                " New Plugin
" Theme
"Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'
Plug 'dracula/vim',{'as':'dracula'}
" System
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix bracey'}
Plug 'christoomey/vim-system-copy'      " New Plugin
" Tools
Plug 'vuciv/vim-bujo'
Plug  'tpope/vim-abolish' 
call plug#end()
" | Plugins |
" | Plugins |
" |---------|
" | Theme   |
" | Theme   |
" |---------|
" | gruvbox |
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

" |---------|
" | dracula |
colorscheme dracula
set termguicolors
highlight CursorLine guibg=#44475A

" |-----------|
" | lightline |
" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"This is now in tmux
            "\ 'component': {
            "\   'time': strftime('%a, %d %b %Y')
            "\ },
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

" |----------|
" | NERDTree |
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
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

" | ---------------- |
" | VimBeGood        |
"let g:vim_be_good_floating=0

" | Theme          |
" | Theme          |
" |----------------|
" | COC            |
" | COC            |
" |----------------|
" | Coc Extensions |
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

" |--------------|
" | Completion   |
" | Completion   |
" |--------------|
" | Coc defaults |
command! -nargs=0 Prettier :CocCommand prettier.formatFile
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

" |--------------|
" | Tab Complete |
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" |----------------|
" | Smart Movement |
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" |---------------|
" | Documentation |
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" |-------------|
" | Refactoring |
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"|-----------|
"| Titlecase |
"nmap <leader>pt <Plug>Titlecase
"vmap <leader>pt <Plug>Titlecase
"nmap <leader>pT <Plug>TitlecaseLine

" |-------------|
" | Sort motion |
let g:sort_motion_visual_block_command="Vissort"

" |---------|
" | NO IDEA |
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" |---------------|
" | Using CocList |
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" | Python |
noremap <Leader>r :CocCommand python.execInTerminal<CR>

" | Completion        |
" | Completion        |
" |-------------------|
" | Personal Defaults |
" | Personal Defaults |
" |-------------------|
" | Spell check       |
map <F6> :setlocal spell! spelllang=es<CR>
set complete+=k
function! FzfSpellSink(word)
    exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
    let suggestions = spellsuggest(expand("<cword>"))
    "return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
    return fzf#run({'window': { 'width': 0.35, 'height': 0.9, 'xoffset': 1 },
                \ 'source': suggestions,
                \ 'sink': function("FzfSpellSink"),
                \ 'down': 10})
endfunction
nnoremap <silent> z= :call FzfSpell()<CR>

" |-------|
" | Mouse |
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

" |-------------------|
" | Copy to clipboard |
noremap <Leader>y "+y

" |------|
" | Exit |
inoremap jk <ESC>
" Exit terminal mode or fzf
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" |---------------|
" | Sane defaults |
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
" Search
set hlsearch
set ignorecase
set incsearch
nnoremap <CR> :nohlsearch<cr>
" resize split
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" |---------------------|
" | Edit & source vimrc |
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vr :so $MYVIMRC<CR>

" |----------|
" | Movement |
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" move through split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" |-----------|
" | taboo.vim |
nmap <silent> <leader>[ :tabp<CR>
nmap <silent> <leader>] :tabn<CR>
nmap <silent> <leader>x :tabclose<CR>
nmap <silent> <leader>X :NERDTreeClose<bar>bufdo bd<CR>
noremap <F2> :TabooRename
"set guioptions-=e
let g:taboo_tab_format="%N:%w%m-|%f|-"
let g:taboo_renamed_tab_format="%N:%w%m-|%f|-"

" |---------|
" | Toggles |
map <leader>tb :TableModeToggle<CR>
map <leader>tg :TagbarToggle<CR>
" | Personal Defaults |
" | Personal Defaults |
" |-------------------|
" | Plugin Settigns   |
" | Plugin Settigns   |
" |-------------------|
" | Colorizer         |
let g:colorizer_auto_color=1
let g:colorizer_skip_comments=1
let g:colorizer_disable_bufleave=1
let g:colorizer_auto_filetype='scss,sass,css,html,md,config,conf'
map <silent> <leader>tc :ColorToggle<CR>

" |---------|
" | fzf.vim |
nnoremap <silent> <leader>o :NERDTreeClose<bar>:Files<CR>
nnoremap <silent> <C-c> :Commands<CR>
nnoremap <silent> <C-p> :BTags<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-path)
" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
            \ 'prefix': '^.*$',
            \ 'source': 'rg -n ^ --color always',
            \ 'options': '--ansi --delimiter : --nth 3..',
            \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" Custom fzf statusline
function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Colors
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
" Popup
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" Line search
nnoremap <leader>/ :Lines<CR>
" |-----------|
" | Emmet-vim |
let g:user_emmet_leader_key=','

" |--------------|
" | Vim markdown |
let g:vim_markdown_folding_disabled=1
set nofoldenable

" |----------------|
" | Vim autoformat |
"let g:python3_host_prog='/usr/bin/python3.8'
" Don't remove trailing spaces
"let g:auto_remove_trailing_spaces=0
" Set java indent format
let g:formatdef_cstm_java='"astyle --mode=java --style=java"'
let g:formatters_java=['cstm_java']
" disabled autoindent filetypes
autocmd FileType properties,jproperties,json let b:autoformat_autoindent=0
" Format on save else use prettier
au BufWrite *.html,*.java,*.xml :Autoformat
"" Format mapping
"noremap <F3> :Autoformat<CR>

" | Plugin Settigns |
" | Plugin Settigns |
" |-----------------|

" |-------------|
" | Tools       |
" | Tools       |
" |-------------|
" | Bujo        |
nmap <C-S> <Plug>BujoAddnormal
imap <C-S> <Plug>BujoAddinsert
nmap <C-Q> <Plug>BujoChecknormal
imap <C-Q> <Plug>BujoCheckinsert
let g:bujo#window_width = 60
noremap <silent> <Leader>tl :Todo g<CR>

" |-------------|
" | system copy |
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'

" |-------------|
" | Preferences |
" | Preferences |
" Read jinja templates
au BufNewFile,BufRead *.html,*.jinja,*.jinja.html set ft=jinja

" Simple math operation
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
