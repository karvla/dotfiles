"""
""" Stolen from https://github.com/miklhh/.dotfiles    
""" True-hearted .vimrc for quick and easy navigation and file editing
""" Author: Mikael Henriksson
"""

" --------------------------------------------------------------------------------------------------------------------
" --                                                 Initialization                                                 --
" --------------------------------------------------------------------------------------------------------------------

" Vim != Vi
set nocompatible

" Enable 24-bit true color support
if exists('+termguicolors')
    " Tmux true color compliance
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " Enable true color
    set termguicolors
endif

" Enable plugin loading, auto indentation and syntax highlighting
filetype plugin indent on
syntax on

" --------------------------------------------------------------------------------------------------------------------
" --                                                    Vim Plug                                                    --
" --------------------------------------------------------------------------------------------------------------------
"
call plug#begin('~/.vim/plugged')

    " Airline Vim tray
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Colorscheme
    Plug 'morhetz/gruvbox'

    " Vim FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'chengzeyi/fzf-preview.vim'

    " Clipboard peek-a-boo
    Plug 'junegunn/vim-peekaboo'

    " Gives :Bdetele and :Bwipeout which behaves like well designed citizens
    Plug 'moll/vim-bbye'

    " Get Vim startup time with :StartupTime
    Plug 'dstein64/vim-startuptime'

    " Vim fugitive (Git integration)
    Plug 'tpope/vim-fugitive'

    " LaTeX synctex synchronization through DBus
    Plug 'peterbjorgensen/sved'

    " Tmux vim navigation
    Plug 'christoomey/vim-tmux-navigator'

    " Neovim LSP plugins
    if has('nvim')
        " Good default LSP server configurations
        Plug 'neovim/nvim-lspconfig'

        " LSP installer helper, trigger with: 'LspInstall' or 'LspInstallInfo'
        Plug 'williamboman/nvim-lsp-installer'

        " Jump to any definition
        Plug 'pechorin/any-jump.vim'

        " Autocompletion & Co
        Plug 'hrsh7th/nvim-cmp'         " Autocompletion engine
        Plug 'hrsh7th/cmp-nvim-lsp'     " Completion support through LSP
        Plug 'hrsh7th/cmp-buffer'       " Completion support for words in buffer
        Plug 'onsails/lspkind-nvim'     " Pictograms for NVim-cmp

        Plug 'hrsh7th/vim-vsnip'        " Snippet engine
        Plug 'hrsh7th/vim-vsnip-integ'  " Snippet support for common LSP-clients
    endif

    " NeoVim sudo read/write (:SudaRead, :SudaWrite)
    Plug 'lambdalisue/suda.vim'

    " Tmux proper syntax highlighting
    Plug 'tmux-plugins/vim-tmux'

    " Fuzzy incsearch
    Plug 'haya14busa/is.vim'
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'

    " Minimap
    "Plug 'wfxr/minimap.vim'
    "Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

" Initialize plugin system
call plug#end()

" --------------------------------------------------------------------------------------------------------------------
" --                                                  Appearance                                                    --
" --------------------------------------------------------------------------------------------------------------------

" Gruvbox colorscheme settings
" More info: https://github.com/morhetz/gruvbox/wiki/Configuration
let g:gruvbox_bold='1'
let g:gruvbox_italic='0'
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" Airline settings
let g:airline_theme = 'gruvbox'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.column = '➔'
set noshowmode

" Line and column numbering
set number
set relativenumber
set ruler
" --------------------------------------------------------------------------------------------------------------------
" --                                                   Keybindings                                                  --
" --------------------------------------------------------------------------------------------------------------------

" Map leader key to spacebar
let mapleader = " "

" Fzf file to open in new buffer by filename
map <Leader>e :FZF<CR>

" Fzf buffer swapping by filename
map <Leader>w :Buffers<CR>

" Fzf lines in current buffer
map <Leader>f :FZFBLines<CR>

" Fzf lines in all open buffers
map <Leader>F :Lines<CR>

" Pinky friendly substitute for <C-u> and <C-d>
nnoremap U <C-u>
nnoremap D <C-d>
xnoremap U <C-u>
xnoremap D <C-d>

" No highlight
nnoremap <leader>n :noh<CR>

" Redraw
nnoremap <leader>r :redraw!<CR>

" Jump forward and backward in VSnip snippets
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" FZF files in '~/.dotfiles'
nnoremap <leader>.e :FZF ~/.dotfiles<CR>

" FZF incsearch
map <leader>/ <Plug>(incsearch-fuzzy-/)
map <leader>? <Plug>(incsearch-fuzzy-?)

" Split
nnoremap <Leader>\| <C-w>v
nnoremap <Leader>- <C-w>s

" --------------------------------------------------------------------------------------------------------------------
" --                                                     Misc                                                       --
" --------------------------------------------------------------------------------------------------------------------

" Enable mouse scrolling
set mouse=a

" Other settings
set laststatus=2
set scrolloff=4
set backspace=2
set hlsearch        " Highlight on search
set hidden          " Keep buffers open in bg for fast reopening
set incsearch       " Highlight text when searching
set signcolumn=no   " No extra linting column
set cursorline      " Highlight the current line
set nowrap

" Use white space for tabbing
set tabstop=4
set shiftwidth=4
set expandtab

" Cycle numbered registers when yanking. This allow the numbered registers to
" act like a ring buffer when performing the yank operation (just like delete
" already does!)
function! SaveLastReg()
    if v:event['regname']==""
        if v:event['operator']=='y'
            for i in range(8,1,-1)
                exe "let @".string(i+1)." = @". string(i)
            endfor
            if exists("g:last_yank")
                let @1=g:last_yank
            endif
            let g:last_yank=@"
        endif
    endif
endfunction
if !exists("g:RegisteredYankRingBuffer")
    let g:RegisteredYankRingBuffer="1"
    :autocmd TextYankPost * call SaveLastReg()
endif
:autocmd VimEnter * let g:last_yank=@"

" Any-Jump settings
let g:any_jump_list_numbers = 1

" Minimap settings
let g:minimap_auto_start = 1

" --------------------------------------------------------------------------------------------------------------------
" --                                            LSP settings for NeoVim                                             --
" --------------------------------------------------------------------------------------------------------------------
"
if has('nvim')

set completeopt=menu,menuone,noselect
lua << EOF
     require('config/cmp')       -- CMP Autocompletion settings
     require('config/keybinds')  -- General LSP keybinds
EOF

" LSP config for servers installed with nvim-lsp-installer
lua << EOF
    local lsp_installer = require("nvim-lsp-installer")
    lsp_installer.on_server_ready(function(server)
        local opts = {
            capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
        }
        server:setup(opts)
    end)
EOF

" VHDL Language server with VHDL-Tool
"lua << EOF
"    local lspconfig = require'lspconfig'
"    local configs = require'lspconfig/configs'
"    local util = require 'lspconfig/util'
"    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
"    -- Check if it's already defined for when reloading this file.
"    if not lspconfig.vhdl_tool then
"      configs.vhdl_tool = {
"        default_config = {
"          cmd = {'vhdl-tool', 'lsp'};
"          filetypes = {'vhdl'};
"          root_dir = util.root_pattern('vhdltool-config.yaml', '.git');
"          settings = {};
"        };
"      }
"    end
"    lspconfig.vhdl_tool.setup{ capabilities = capabilities }
"EOF


endif "if has('nvim')
