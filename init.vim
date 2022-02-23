if has("nvim")
  let g:plug_home = stdpath('data') . '/user/gerar/appdata/local/nvim/plugged'
endif

set nocompatible
set number
set relativenumber
set noswapfile
set hlsearch
set laststatus=2
set autochdir
set mouse=a
set clipboard=unnamed
syntax enable
set showcmd
set cursorline
set encoding=utf-8
set showmatch
set lazyredraw
set backspace=indent,eol,start
set autoindent
set nobackup
set nowritebackup
set updatetime=700
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
set termguicolors
set exrc
set title 

call plug#begin('~/AppData/Local/nvim/plugged')
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'

" indentation 
Plug 'Yggdroot/indentLine'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Floaterm
Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/popup.nvim'

" lualine
Plug 'nvim-lualine/lualine.nvim'

" icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

"jsx support
Plug 'maxmellon/vim-jsx-pretty'

"windows manager
Plug 'romgrk/barbar.nvim'

" lua colors
Plug 'folke/lsp-colors.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'


"Typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

call plug#end()


" Configuracion Sintax 
let  g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1
highlight Normal ctermbg=NONE
let g:user_emmet_mode='a'

" close tag 
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx,*.rs'

" coc-yank 
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:highlightedyank_highlight_duration = 50

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
 set t_Co=256
  " when i use ayu
  let ayucolor= 'dark'
  
  " when i use neosolarized
  "let g:neosolarized_termtrans=1 
  "let g:neosolarized_italics=1
  runtime ./colors/ayu.vim
  colorscheme ayu
endif

" imports
runtime ./plug-config/coc.vim
runtime ./plug-config/barbar.vim
runtime ./plug-config/floaterm.vim
runtime ./plug-config/nerdtree.vim
runtime ./plug-config/indentline.vim
runtime ./mapping.vim


" slint fix problems
autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>

" Definicion de leader key
let mapleader=" "
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact


" NerdTree config
nnoremap <leader>m  :NERDTreeToggle<CR>

