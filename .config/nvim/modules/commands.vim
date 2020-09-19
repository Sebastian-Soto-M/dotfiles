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

" disabled autoindent filetypes
autocmd FileType properties,jproperties,json let b:autoformat_autoindent=0
" Format on save else use prettier
au BufWrite *.html,*.java,*.xml,*.md,*.sh :Autoformat
"" Format mapping
noremap <A-f> :Autoformat<CR>
inoremap <A-f> <ESC>:Autoformat<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Per file mapping
func! GodotSettings() abort
    setlocal foldmethod=expr
    setlocal tabstop=4
    nnoremap <buffer> <leader>rgrl :GodotRunLast<CR>
    nnoremap <buffer> <leader>rgr :GodotRun<CR>
    nnoremap <buffer> <leader>rgc :GodotRunCurrent<CR>
    nnoremap <buffer> <silent> <leader>f :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end

func ConfigAdd()
    !/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME add '%:p'
endfunc
augroup configs | au!
    au BufWritePost config.h !sudo make clean install
    au BufWritePost $XDG_CONFIG_HOME/X11/xresources/*,.Xresources :silent call ConfigAdd() | :silent !xrdb ~/.Xresources
    au BufWritePost $XDG_CONFIG_HOME/nvim/coc-settings.json,$XDG_CONFIG_HOME/nvim/modules/*,$XDG_CONFIG_HOME/scripts/* :silent call ConfigAdd()
    au BufWritePost .zshenv,$XDG_CONFIG_HOME/picom/picom.conf,$XDG_CONFIG_HOME/sxhkd/sxhkdrc,$XDG_CONFIG_HOME/tmux/tmux.conf,$XDG_CONFIG_HOME/zsh/*.zsh* :silent call ConfigAdd()
augroup END

au FileType sh,bash,zsh vn <buffer> <silent> <leader>f :Tabularize /)\\|;;<CR>
