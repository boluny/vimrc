set nu
syntax enable

filetype plugin indent on

set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
Bundle 'gmarik/vundle'

" my customized plugins
Bundle 'The-NERD-tree'
Bundle 'ctags.vim'
Bundle 'TabBar'
Bundle 'AutoClose'
Bundle 'Tagbar'
Bundle 'Solarized'		

" General configuration

set guifont=Dejavu\ Sans\ Mono:h11
set bg=light
colorscheme solarized

set incsearch
set hlsearch

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set wildmenu wildmode=longest,list:full
set showmatch

" key maps
noremap <C-n> :NERDTreeToggle<CR>

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

