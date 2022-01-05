"""""""""""""""""""""
" Plugin (vim-plug) "
"""""""""""""""""""""
call plug#begin()

Plug 'neovim/nvim-lspconfig'
" Start up view
Plug 'mhinz/vim-startify'
" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Color theme
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
" File Explorer
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"File Icon (Put it at last)
Plug 'ryanoasis/vim-devicons'

call plug#end()

" NeoVim Setting
set relativenumber
syntax on
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Color scheme
if has('termguicolors')
    set termguicolors
endif

let g:sonokai_style = 'atlantis'
colorscheme sonokai

""""""""""""
" Air line "
""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#enabled = 1

""""""""""""
" NerdTree "
""""""""""""

" Exit NeoVim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" shortcut
nnoremap <F5> :NERDTree<CR>
nnoremap <F5> :NERDTreeToggle<CR>

" NerdTree UI setting
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2
let g:NERDTreeHidden=0
