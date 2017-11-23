set nu
syntax enable
set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set nocompatible               " be iMproved
filetype off                   " required!

if has("win32") || has("win64")
    " that is for windows
    " there is a win32unix for Cygwin configuration
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim
language messages zh_CN.utf-8
else 
    " that's for Linux
    set rtp+=~/.vim/bundle/Vundle.vim
endif

call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" my customized plugins
Plugin 'The-NERD-tree'
Plugin 'ctags.vim'
Plugin 'TabBar'
Plugin 'Tagbar'
Plugin 'Solarized'		
Plugin 'Valloric/YouCompleteMe'
"Plugin 'SirVer/ultisnips'

" for javascript related plugins
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'

call vundle#end()

filetype plugin indent on

" General configuration
if has('gui_running')
    if has('win32') || has('win64')
        set guifont=Dejavu\ Sans\ Mono:h11
    else
        set guifont=Dejavu\ Sans\ Mono\ 11
    endif
    set bg=dark
    colorscheme solarized
    " set the cursor looking in insert and command insert mode
    " see :help guicursor for further help
    set guicursor=i-ci:block-Cursor/lCursor
else 
    colorscheme desert
endif

" configure the search preferences
set incsearch
set hlsearch
set ignorecase
set smartcase

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
" autocmd CompleteDone * pclose

" Configuration for javascript, use C-x C-o to trigger
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Configuration for emmet.vim, the default trigger shortcut 
" is C-y , 
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'

" Configuration for YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

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

