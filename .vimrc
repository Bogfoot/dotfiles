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
filetype plugin indent on
highlight ColorColumn ctermbg=blue
call matchadd('ColorColumn','\%81v',100)
