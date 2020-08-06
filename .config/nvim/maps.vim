inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
nmap ++ <plug>NERDCommenterToggle
nmap <C-n> :NERDTreeToggle<CR>
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> K :call <SID>show_documentation()<CR>
vmap ++ <plug>NERDCommenterToggle

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nmap <leader>a  <Plug>(coc-codeaction)
nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rr <Plug>(coc-rename)

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
noremap <Leader>r :CocCommand python.execInTerminal<CR>
map <silent> <leader>tc :ColorToggle<CR>

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

" taboo.vim 
let g:taboo_renamed_tab_format="%N:%w%m-|%f|-"
let g:taboo_tab_format="%N:%w%m-|%f|-"
nmap <silent> <leader>X :NERDTreeClose<bar>bufdo bd<CR>
nmap <silent> <leader>[ :tabp<CR>
nmap <silent> <leader>] :tabn<CR>
nmap <silent> <leader>x :tabclose<CR>
noremap <F2> :TabooRename

" personal mappings
inor {<CR> {<CR>}<C-o>O
inoremap jk <ESC>
map <F6> :setlocal spell! spelllang=es<CR>
map <leader>tb :TableModeToggle<CR>
map <leader>tg :TagbarToggle<CR>
nnoremap <CR> :nohlsearch<cr>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vr :so $MYVIMRC<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" Simple math operation
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

inoremap <C-J> <C-O>o<C-G>u
inoremap <C-K> <C-O>O<C-G>u
inoremap jj <C-O>j<C-G>u
inoremap kk <C-O>k<C-G>u
nnoremap <silent> <C-c> :Commands<CR>
nnoremap <silent> <C-p> :BTags<CR>
nnoremap <silent> <leader>o :NERDTreeClose<bar>:Files<CR>
noremap <silent> <leader>w :wa<CR>
