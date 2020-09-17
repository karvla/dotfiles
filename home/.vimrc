set nocompatible              " be iMproved, required
filetype off                  " required

" Install vim-plug
" sh -c 'curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin('~/.vim/plugged')
Plug 'JuliaEditorSupport/julia-vim'
Plug 'mattn/emmet-vim'
Plug 'psf/black'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'dpelle/vim-LanguageTool'
Plug 'lervag/vimtex'



let g:user_emmet_leader_key=','
let g:languagetool_jar='$HOME/.vim/plugged/vim-LanguageTool/LanguageTool-5.1-SNAPSHOT/languagetool-commandline.jar'


call plug#end()            " required
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
