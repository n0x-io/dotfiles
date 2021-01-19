syntax enable
set mouse=a
set nu
set smartindent
set noswapfile

set undodir=~/.config/nvim/undodir
set undofile

set incsearch
set smartcase

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab


" Plugin stuff "
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'mbbill/undotree'
call plug#end()

" colorscheme stuff "
colorscheme nord

" Keybinds "
let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Undotree "
nnoremap <leader>u :UndotreeToggle<CR>
" NERDTree "
nnoremap <leader>n :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
