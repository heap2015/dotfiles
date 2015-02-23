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

" --- Ruby ---
Plugin 'vim-ruby/vim-ruby'

" --- Jedi-vim ---
Plugin 'davidhalter/jedi-vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-pathogen'

Plugin 'altercation/vim-colors-solarized'

call vundle#end()            		" required
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

syntax enable
set background=dark

" let g:molokai_original = 1
" colorscheme molokai

set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=0

colorscheme solarized

map <leader>jd :YcmCompleter GoTo<CR>
