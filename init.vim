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
  let g:plug_home = stdpath('data') . '/user/gerar/appdata/local/nvim/plugged'
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

" theme
Plug 'ayu-theme/ayu-vim'

" terminal and search files
Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'tpope/vim-rhubarb'

" tree and tabs
Plug 'romgrk/barbar.nvim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'

" Lsp config
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
Plug 'L3MON4D3/LuaSnip'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'folke/lsp-colors.nvim'

call plug#end()

" theme
let ayucolor="dark"
colorscheme ayu

cnoreabbrev g Git
cnoreabbrev gopen GBrowse

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

" NerdTree config
nnoremap <leader>e :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'',
                \ 'Staged'    :'',
                \ 'Untracked' :'',
                \ 'Renamed'   :'',
                \ 'Unmerged'  :'=',
                \ 'Deleted'   :'',
                \ 'Dirty'     :'﯇',
                \ 'Ignored'   :'',
                \ 'Clean'     :'',
                \ 'Unknown'   :'?',
                \ }

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" BARBAR 
let bufferline = get(g:, 'bufferline', {})
" (compatibility with NVIM-TREE)
let s:treeEnabled=0
function! ToggleNvimTree()
	   if s:treeEnabled
			 lua require('custom.tree').close()
			 let s:treeEnabled = 0
	   else
			 lua require('custom.tree').open()
			 let s:treeEnabled = 1
	   endif
endfunction
nnoremap <silent><leader>f :call ToggleNvimTree()<cr>
let bufferline.auto_hide = v:true
let bufferline.animation = v:true
let bufferline.no_name_title = "untitled"
