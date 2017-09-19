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
Plugin 'gmarik/vundle'

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Bundles-----------------------------
Plugin 'tpope/vim-sensible'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'ntpeters/vim-better-whitespace'
"Bundle 'kein/ctrlp.vim'
"Bundle 'scrooloose/syntastic'
"
"---clojure stuff---
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-classpath'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'


"?- don't work Bundle 'Valloric/YouCompleteMe'
"Bundle 'valloric/YouCompleteMe' doesn't really have a bundle 
    "(BACKUP-not necessary) git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
    "cd ~/.vim/bundle/YouCompleteMe
    "./install.sh --clang-completer

" Bundles:color-----------------------
Plugin 'vim-scripts/SyntaxAttr.vim'
Plugin 'DetectIndent'
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
Plugin 'noahfrederick/vim-hemisu'

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
set noincsearch			"incrementally match the search

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Types of files to ignore when autocompleting
set wildignore+=*.o,*.class,*.git,*.svn,*.class

" Save folds on save-file and open-file
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" don't know why, everyone seems to like 4.  I like 3.
set shiftwidth=4
set expandtab
set autoindent
" let backspace delete indent
set softtabstop=4

" vsplit opens windows to the right of the current
set splitright
" vsplit opens windows below the current
set splitbelow

"turn off for Makefiles and python
autocmd FileType make setlocal noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
" the command 'retab' will fix a file
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

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

"color the 80th column, just so I know where it is
set colorcolumn=80
highlight colorcolumn ctermbg=lightgrey

set background=dark
colorscheme hemisu

"pretty print XML
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
