let g:mapleader = "\<Space>"


set nocompatible
filetype off

set rtp+=~/.local/share/nvim/site/autoload/plug.vim


call plug#begin()
Plug 'hrsh7th/cmp-nvim-lsp'						"Completion plugins 
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'								"End completion plugins
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'xiyaowong/nvim-transparent'			"Transparent background
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'glepnir/dashboard-nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update... Nice syntax highlighting
Plug 'vimwiki/vimwiki'								"Personal wiki page, leader ww
Plug 'tpope/vim-surround'							"Use ysw to surround a word, line, paragraph,... in a symbol (a-Z, 0-9, {[<()>]}, ...)
Plug 'tpope/vim-commentary'								"For commenting out a block of code
" Plug 'tc50cal/vim-terminal'						"Vim Terminal
Plug 'rafi/awesome-vim-colorschemes'	"Vim colorschemes
Plug 'kana/vim-smartinput'						"This one matches containers
Plug 'frazrepo/vim-rainbow'						"Colours matching containers in .c, .cpp,... files
Plug 'vim-airline/vim-airline'				"Statusbar
Plug 'vim-airline/vim-airline-themes'	"Statusbar themes
Plug 'preservim/nerdtree'							"File explorer for VIM
" Plug 'bling/vim-bufferline'						"Buffer line
Plug 'lervag/vimtex'									"vimtex for editing TEX files in VIM
Plug 'jakewvincent/texmagic.nvim'

" Plug 'jbyuki/nabla.nvim'							"LaTeX equations displayed in nvim

Plug 'ellisonleao/glow.nvim'

Plug 'pboettch/vim-cmake-syntax'			"cmake syntax highlighting


call plug#end()

set clipboard+=unnamedplus

"Kite completion
let g:kite_supported_languages = ['*']
let g:kite_tab_complete=1
set completeopt+=menuone

let g:tex_flavor = 'latex'

autocmd BufRead,BufNewFile *.wiki set filetype=tex
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.wiki'}]

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nnoremap <leader>p :lua require("nabla").popup()<CR> " Customize with popup({border = ...})  : `single` (default), `double`, `rounded`

" let g:airline#extensions#bufferline#enabled=1  "Enable vimtex integration
let g:airline#extensions#vimtex#enabled=1  "Enable vimtex integration
" let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#nerdtree_statusline = 1 " Enable nerdtree integration

colorscheme alduin
" colorscheme tokyonight
let g:alduin_Shout_Dragon_Aspect = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"Container coloring
au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active = 1

"Osnovne stvari.
set rnu
set laststatus=2
set ruler
set cursorline
set scrolloff=8
set sidescrolloff=8
syntax on
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set nowrap
set smartcase
set noswapfile
set incsearch
set laststatus=2  " always display the status line
set mouse=a
"set foldmethod=syntax

scriptencoding utf-8
let g:transparent_enabled = v:true

"Completion dialog
:set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
:inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

:inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'



filetype plugin indent on

"Ovdi se nalazi kod za keyword highlighter 
augroup vimrc_todo
    au!
		au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

"Moje naredbe
nmap <F3> :set nu! <CR>
nmap <Leader>-c :%s/\s\+$// <CR>
nmap <Leader>go :source vimbook.vim <CR>
nmap <Leader>end :w <CR>:mksession! vimbook.vim<CR>:q <CR>
nmap <Leader>ws :w <CR> :source %<CR>

"nnoremap <C-o> :TerminalTab zsh <CR> "Iz nekog razloga ne radi
nnoremap <C-f> :NERDTreeFocus <CR>
nnoremap <C-n> :NERDTree <CR>
nnoremap <C-t> :NERDTreeToggle <CR>
vnoremap < <gv
vnoremap > >gv



"TODO: Get this to work END TODO Got it to work
"lua completion for cmp

lua <<EOF
require('texmagic').setup{}
EOF

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
			['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
EOF
