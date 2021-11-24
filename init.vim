set number
set relativenumber
set noswapfile
set hlsearch
set guitablabel=%t
set laststatus=2
set autochdir
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set cursorline
set encoding=utf-8
set showmatch
set backspace=indent,eol,start
set autoindent
set cindent
set smartindent
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=100
set shortmess+=c
filetype plugin indent on
set sw=2
set softtabstop=2
set incsearch
set smartcase
set background=dark
set ignorecase
set tabstop=2
set expandtab
set modifiable
set textwidth=80
set undofile
set updatetime=100
set termguicolors
set exrc
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:highlightedyank_highlight_duration = 25

if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif



" Configuracion Sintax 
let g:jsx_ext_required = 1
highlight Normal ctermbg=NONE
let g:javascript_plugin_flow = 1
let g:user_emmet_mode='a'
" HTML, JSX
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx,*.rs'

call plug#begin('~/AppData/Local/nvim/plugged')
" basic functionality
Plug 'mhinz/vim-signify'
Plug 'terryma/vim-multiple-cursors'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" status bar
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" navigation
Plug 'christoomey/vim-tmux-navigator'

" theme
Plug 'ayu-theme/ayu-vim'

" terminal and search files
Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'tpope/vim-rhubarb'

" Lsp config
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
Plug 'L3MON4D3/LuaSnip'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'folke/lsp-colors.nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()

" theme
let ayucolor="dark"
colorscheme ayu

" Status line
if !exists('*fugitive#statusline')
  set statusline+=%{fugitive#statusline()}
endif

cnoreabbrev g Git
cnoreabbrev gopen GBrowse

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="ayu"
let g:airline_powerline_fonts = 1

" Definicion de leader key
let mapleader=" "
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

" FLoaterm mapping tangs
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'
" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
hi FloatermBorder guibg=blue guifg=cyan
hi Floaterm guibg=black
hi FloatermNC guibg=gray

" telescope config mappings 
nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap  <silent> ;b <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

:lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF


