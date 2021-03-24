:set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'frazrepo/vim-rainbow'
Plugin 'neoclide/npm.nvim', {'do' : 'npm install'}
Plugin 'preservim/nerdtree'


call vundle#end()


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
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line
