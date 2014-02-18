" jvarsoke - .vimrc - a work in progress
"

set nocompatible               " be iMproved
filetype off                   " required!

"Vundle Block ---------------------------------------------------------------
"bootstrap: git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Bundles-----------------------------
Bundle 'tpope/vim-sensible'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'kein/ctrlp.vim'
"Bundle 'scrooloose/syntastic'
"---clojure stuff---
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'

" Bundles:color-----------------------
Bundle 'vim-scripts/SyntaxAttr.vim'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'twerth/ir_black'
"Bundle 'jnurmine/Zenburn'
"Bundle 'vim-scripts/desert256.vim'
"Bundle 'brettof86/vim-codeschool'
"Bundle 'jonathanfilip/vim-lucius'
"Bundle 'Lokaltog/vim-distinguished'
"Bundle 'vim-scripts/Cleanroom'
"Bundle 'vim-scripts/sienna'
"Bundle 'vim-scripts/candy.vim'
"Bundle 'vim-scripts/candycode.vim'
"Bundle 'endel/vim-github-colorscheme'
Bundle 'noahfrederick/vim-hemisu'


syntax on
filetype plugin indent on

"----------------------------------------------------------------------------
" Colors, colors: I am a nightmare walk'n
"----------------------------------------------------------------------------
let &t_Co=256
set background=dark
colorscheme hemisu

"----------------------------------------------------------------------------
" SyntaxAttr
"----------------------------------------------------------------------------
map -a	:call SyntaxAttr()<CR>

"----------------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------------
" CTRL-N open NERDTree
map <C-n> :NERDTreeToggle<CR>

" open NERDTree if no file is being edited
autocmd vimenter * if !argc() | NERDTree | endif

" auto-close NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeWinPos = "right"


"----------------------------------------------------------------------------
"Misc settings
"----------------------------------------------------------------------------
set hlsearch                    "highlights last searched item
set ignorecase			"case insensitive search
set incsearch			"incrementally match the search

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Types of files to ignore when autocompleting
set wildignore+=*.o,*.class,*.git,*.svn,*.class

" Save folds on save-file and open-file
au BufWinLeave * mkview
au BufWinEnter * silent loadview

"turn off for Makefiles and python
autocmd FileType make setlocal noexpandtab 
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
" the command 'retab' will fix a file

" detect the filetype from the shebang-line
autocmd BufNewFile,BufRead * filetype detect

"------------------------------------------------
" stuff from old vimrc
"------------------------------------------------
"au VimEnter * NoMatchParen			"don't load match-paren plugin

" commands
map <F12> : if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax on <Bar> endif <CR>
map <F10> : call SetColor() <CR>

function! SetColor()
   if &dict == "offmylawn"
      set dict=standard
   else
      set dict=offmylawn
   endif
endfunction

if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
endif

"------------------------------------------------------------------------------
" Common misspellings
"------------------------------------------------------------------------------
iab teh		the
iab Teh		The
iab shoudl	should
iab Shoudl	Should


set background=dark
colorscheme hemisu
" ~/.vimrc ends here
