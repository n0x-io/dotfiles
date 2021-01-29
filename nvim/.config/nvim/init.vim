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
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'mbbill/undotree'
Plug 'hugolgst/vimsence'
call plug#end()

" colorscheme stuff "
colorscheme nord

let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'


" Keybinds "
let mapleader = " "

"inoremap <silent><expr> <TAB> 
"    \ pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1] =~# '\s'
"endfunction

"inoremap <silent><expr> <c-space> coc#refresh()

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
