" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Read jinja templates
au BufNewFile,BufRead *.html,*.jinja,*.jinja.html set ft=jinja
" Auto source Xresources
au BufWritePost .Xresources !xrdb <afile>

" disabled autoindent filetypes
autocmd FileType properties,jproperties,json let b:autoformat_autoindent=0
" Format on save else use prettier
au BufWrite *.html,*.java,*.xml :Autoformat
"" Format mapping
"noremap <F3> :Autoformat<CR>
