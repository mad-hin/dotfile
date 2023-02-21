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
" wilder.nvim
if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
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
autocmd Syntax nerdtree syntax clear NERDTreeFlags

" Color scheme
colorscheme onedark

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
let g:NERDTreeHidden=1

"""""""""""""""
" wilder.nvim "
"""""""""""""""

" Key bindings can be changed, see below
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ }))
