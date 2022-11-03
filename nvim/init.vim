set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000
set guifont=Hack\ 12
" plugins

call plug#begin("~/.config/nvim/plugged")
	Plug 'catppuccin/nvim', {'as': 'catpuccin'}
	Plug 'sheerun/vim-polyglot'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'jose-elias-alvarez/null-ls.nvim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'SirVer/ultisnips/'
	Plug 'mlaursen/vim-react-snippets'
	Plug 'neoclide/coc-snippets'
	Plug 'ryanoasis/vim-devicons'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'tpope/vim-surround'
	Plug 'akinsho/bufferline.nvim'
	Plug 'andymass/vim-matchup'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-media-files.nvim'
call plug#end()

let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha

lua << EOF
require("catppuccin").setup()
require('telescope').load_extension('media_files')
EOF

set termguicolors
lua << EOF
require("bufferline").setup{options = {numbers = function(opts)
    return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
  end,}}
EOF

colorscheme catppuccin

function! ToggleNERDTree()
  NERDTreeToggle
  silent NERDTreeMirror
endfunction

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nnoremap <C-e> :call ToggleNERDTree()<CR>
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <C-f> :Rg<CR>

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
