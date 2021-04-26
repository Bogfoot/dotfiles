:set nocompatible              " be improved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'frazrepo/vim-rainbow'
Plugin 'neoclide/npm.nvim', {'do' : 'npm install'}
Plugin 'vim-airline/vim-airline'
Plugin 'preservim/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/gruvbox-material'
call vundle#end()

colorscheme gruvbox-material
let g:rainbow_active = 1
:set number
nmap <F3> :set rnu! <CR>
:set laststatus=2
:set ruler
:set cursorline
syntax on
:set tabstop=4 softtabstop=4
:set smartindent
:set nowrap
:set smartcase
:set noswapfile
:set incsearch
:set spell
:set wildmenu
:set laststatus=2  " always display the status line
