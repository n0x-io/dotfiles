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

set nowrap

" Plugin stuff "
call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'arcticicestudio/nord-vim'
Plug 'mg979/vim-visual-multi'
Plug 'mbbill/undotree'
#Plug 'hugolgst/vimsence'
call plug#end()

" colorscheme stuff "
colorscheme nord

let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'


" Keybinds "
let mapleader = " "

" quickly move between editors
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader><Right> :wincmd l<CR>

" Undotree "
nnoremap <leader>u :UndotreeToggle<CR>
" NERDTree "
nnoremap <leader>n :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


let g:airline_powerline_fonts = 1
let g:airline_theme = "nord"

let g:coc_global_extensions = ['coc-git', 'coc-tsserver', 'coc-clangd', 'coc-java', 'coc-sql', 'coc-spell-checker']
