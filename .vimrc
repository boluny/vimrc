set nu
syntax enable
set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8

set nocompatible               " be iMproved
filetype off                   " required!

if has("win32") || has("win64")
    " that is for windows
    " there is a win32unix for Cygwin configuration
    set rtp+=$VIM/vimfiles/bundle/vundle/
else 
    " that's for Linux
    set rtp+=~/.vim/bundle/vundle/
endif

call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" my customized plugins
Bundle 'The-NERD-tree'
Bundle 'ctags.vim'
Bundle 'TabBar'
Bundle 'Tagbar'
Bundle 'Solarized'		

" for javascript related plugins
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/emmet-vim'


filetype plugin indent on

" General configuration
if has('gui_running')
    set guifont=Dejavu\ Sans\ Mono:h11
    set bg=dark
    colorscheme solarized
    " set the cursor looking in insert and command insert mode
    " see :help guicursor for further help
    set guicursor=i-ci:block-Cursor/lCursor
endif

" configure the search preferences
set incsearch
set hlsearch

set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set wildmenu wildmode=longest,list:full
set showmatch

" if set indent, the backspace should be set to 2, equal to 
" indent,eol, start, see `:help 'backspace'`
set autoindent
set smartindent
set backspace=indent,eol,start

" Configuration for javascript, use C-x C-o to trigger
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Configuration for emmet.vim, the default trigger shortcut 
" is C-y , 
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'

nmap <F8> :TagbarToggle<CR>

" key maps
noremap <C-n> :NERDTreeToggle<CR>
noremap <silent> <C-b> :exe ':silent !firefox %' <CR>

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

