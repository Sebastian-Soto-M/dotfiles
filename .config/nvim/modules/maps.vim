" navigation
inoremap <C-J> <C-O>o<C-G>u
inoremap <C-K> <C-O>O<C-G>u
inoremap jj <C-O>j<C-G>u
inoremap kk <C-O>k<C-G>u
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap <leader>/ :Lines<CR>
nnoremap <silent> <C-p> :BTags<CR>
nnoremap <silent> <leader>o :Files<CR>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
"explorer
nmap <silent> <space>ev :CocCommand explorer --preset vim<CR>
nmap <silent> <space>et :CocCommand explorer --preset tab<CR>
nmap <silent> <space>el :CocList explPresets<CR>
nmap <silent> <space><space> :CocCommand explorer --toggle<CR>

" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
nmap ++ <plug>NERDCommenterToggle
nnoremap <silent> K :call <SID>show_documentation()<CR>
vmap ++ <plug>NERDCommenterToggle

" docs
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" refactor
nmap <leader>a  <Plug>(coc-codeaction)
nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rr <Plug>(coc-rename)

" Coc info
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" fzf
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

imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
nmap <leader><tab> <plug>(fzf-maps-n)
nnoremap <silent> z= :call FzfSpell()<CR>
omap <leader><tab> <plug>(fzf-maps-o)
xmap <leader><tab> <plug>(fzf-maps-x)

inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
            \ 'prefix': '^.*$',
            \ 'source': 'rg -n ^ --color always',
            \ 'options': '--ansi --delimiter : --nth 3..',
            \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

function! s:fzf_statusline()
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Colors
let g:fzf_colors =
    \ { 'bg':      ['bg', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'fg':      ['fg', 'Normal'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'header':  ['fg', 'Comment'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'spinner': ['fg', 'Label']}
" Popup
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" taboo.vim 
let g:taboo_renamed_tab_format="%N:%w%m-|%f|-"
let g:taboo_tab_format="%N:%w%m-|%f|-"
nmap <silent> <leader>X :bufdo bd<CR>
nmap <silent> <leader>[ :tabp<CR>
nmap <silent> <leader>] :tabn<CR>
nmap <silent> <leader>x :tabclose<CR>
noremap <F2> :TabooRename
noremap <silent> <F3> :Goyo<CR>

" personal mappings
inor {<CR> {<CR>}<C-o>O
inoremap jk <ESC>
map <silent> <F6> :setlocal spell! spelllang=es<CR>
map <leader>tb :TableModeToggle<CR>
map <leader>tg :TagbarToggle<CR>
nnoremap <CR> :nohlsearch<cr>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <leader>vr :so $MYVIMRC<CR>
nnoremap <silent> <C-c> :Commands<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
noremap <silent> <leader>w :wa<CR>

" Tools
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
map <silent> <leader>tc :ColorToggle<CR>
noremap <Leader>r :CocCommand python.execInTerminal<CR>
