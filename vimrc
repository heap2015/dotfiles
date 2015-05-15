set number
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set autoindent
set wrap
set showmatch
set hlsearch
set incsearch
set listchars=tab:..
set list
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

set nu
set ls=2

set smartcase

map <F3> /
map <F4> :let @/ = ""<CR>

set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
" Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
" Plugin 'majutsushi/tagbar'          	" Class/module browser

"------------------=== Other ===----------------------
" Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
" Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
" Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
" Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more

"--------------=== Snippets support ===---------------
" Plugin 'garbas/vim-snipmate'		" Snippets manager
" Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
" Plugin 'tomtom/tlib_vim'		" dependencies #2
" Plugin 'honza/vim-snippets'		" snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
" Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
" Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
" --- Jedi-vim ---
Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim
Plugin 'tpope/vim-surround'     " Parentheses, brackets, quotes, XML tags, and more

" auto pairs
Plugin 'jiangmiao/auto-pairs'

" --- Ruby ---
Plugin 'vim-ruby/vim-ruby'

" pathogen
Plugin 'tpope/vim-pathogen'

" colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'reedes/vim-colors-pencil'

" NERD tree plugin
Plugin 'scrooloose/nerdtree'

" PHP extended syntax highlighting
Plugin 'StanAngeloff/php.vim'

" Syntax checker
Plugin 'scrooloose/syntastic'

" HTML & CSS
Plugin 'mattn/emmet-vim'

call vundle#end()            		" required

execute pathogen#infect()

filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
" Python-mode settings
"=====================================================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope_completion = 1
" let g:pymode_rope_complete_on_dot = 1

" настройки jedi and ycm
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" увеличим максимальную сложность функций при проверке
let g:pymode_lint_options_mccabe = { 'complexity': 20 }

" документация
" let g:pymode_doc = 0
" let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
" let g:pymode_run = 0

let g:pymode_trim_whitespaces = 1

let g:pymode_options_colorcolumn = 0

set backspace=2
set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]

syntax enable
set background=dark
set t_Co=256

let g:molokai_original = 1
colorscheme molokai

" let g:solarized_termcolors=256
"let g:solarized_termtrans=0
" colorscheme solarized

map <leader>jd :YcmCompleter GoTo<CR>
map <C-p> :bp<CR>
map <C-n> :bn<CR>
map <C-c> :bd<CR>
map <F2> :w<CR>

" airline status bar
let g:airline#extensions#tabline#enabled = 1
set laststatus=2


" NERD Tree binding
map <C-l> :NERDTreeToggle<CR>

" Put at the very end of your .vimrc file.

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Syntax checking
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_ignore_files = ['\.py$']
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
