set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'mattn/emmet-vim'
Plugin 'psf/black'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'

let g:user_emmet_leader_key=','

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this linexxxxxx
 set backspace=indent,eol,start
 set clipboard=unnamedplus
 syntax on
 filetype plugin indent on
 set number
 set hidden
 set tabstop=4
 set shiftwidth=4
 set expandtab
 set clipboard=unnamedplus
 let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
