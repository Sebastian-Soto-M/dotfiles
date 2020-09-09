" Install vim-plug if it isn't already
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Autocompletion
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-surround'
Plug 'jparise/vim-graphql'
" Tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git
Plug 'tpope/vim-fugitive'
" Format
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'christoomey/vim-sort-motion'
Plug 'Chiel92/vim-autoformat'
Plug 'michaeljsmith/vim-indent-object'
Plug 'lervag/vimtex'
" Interface
Plug 'bananushka/taboo.vim'
Plug 'chrisbra/Colorizer'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'josa42/vim-lightline-coc'
Plug 'junegunn/goyo.vim'
Plug 'lepture/vim-jinja'
Plug 'majutsushi/tagbar'
Plug 'yuttie/comfortable-motion.vim'
" Theme
Plug 'dracula/vim',{'as':'dracula'}
" System
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix bracey'}
Plug 'christoomey/vim-system-copy'
" Tools
Plug 'tpope/vim-abolish' 
Plug 'habamax/vim-godot'
Plug 'baskerville/vim-sxhkdrc'
call plug#end()
