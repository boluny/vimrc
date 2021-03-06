set nu
syntax enable
set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set nocompatible               " be iMproved
filetype off                   " required!

" if has("win32") || has("win64")
"     " that is for windows
"     " there is a win32unix for Cygwin configuration
"     set rtp+=$VIM/vimfiles/bundle/Vundle.vim
" language messages zh_CN.utf-8
" else 
"     " that's for Linux
"     set rtp+=~/.vim/bundle/Vundle.vim
" endif

call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle
" required! 
" Plugin 'gmarik/Vundle.vim'

" my customized plugins
Plug 'preservim/nerdtree'
Plug 'vim-scripts/ctags.vim'
" Plugin 'TabBar'
Plug 'majutsushi/Tagbar'
" Plug 'Solarized'		
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plugin 'SirVer/ultisnips'

" for javascript related plugins
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'

call plug#end()

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
    " set the cursor icon looks like in 'insert' and 'command insert' mode
    " see :help guicursor for further help
    set guicursor=i-ci:block-Cursor/lCursor
else 
    " onedark.vim override: Don't set a background color when running in a terminal;
    " just use the terminal's background color
    " `gui` is the hex color code used in GUI mode/nvim true-color mode
    " `cterm` is the color code used in 256-color mode
    " `cterm16` is the color code used in 16-color mode
    if (has("autocmd") && !has("gui_running"))
      augroup colorset
        autocmd!
        let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
      augroup END
    endif
    colorscheme onedark
    "colorscheme desert
endif

set term=rxvt-unicode-256color

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
" prevent the scrach window to appear
"set completeopt-=preview

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
autocmd BufNewFile,BufReadPost *.cc,*.C set filetype=cpp

let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'

" Configuration for YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_invoke_completion = '<C-n>'
let g:ycm_use_clangd = 1

" Configuration for vim-airline
set laststatus=2
let g:airline_theme="papercolor" 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Configuration for Tagbar
nmap <F8> :TagbarToggle<CR>

" key maps
noremap <C-n> :NERDTreeToggle<CR>
noremap <M-F7> :YcmCompleter GoToReferences<CR>
" noremap <silent> <C-b> :exe ':silent !firefox %' <CR>
nmap <C-l> :bn<CR>
nmap <C-h> :bp<CR>

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

