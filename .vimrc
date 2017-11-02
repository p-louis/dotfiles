" UI Settings
" {

set nocompatible
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
set shell=/bin/bash

call vundle#begin()
" Plugin 'VundleVim/Vundle.vim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
call vundle#end()

filetype plugin indent on

set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\

set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1

set number
set relativenumber
set showmode
syntax on
set nocp
"set cursorline


set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set backspace=indent,eol,start
set linespace=0
set showmatch
set incsearch
set hlsearch
set smartcase
set smarttab
set smartindent
set ignorecase
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set scrolloff=3
set foldenable
set list
set listchars=tab:>\ ,trail:@,extends:#,nbsp:.
" }

" execute pathogen#infect()

let g:ctrlp_working_path_mode = 0
" Prepare commandline
" {
if has('cmdline_info')
  set ruler
  set rulerformat=%30($=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
  set showcmd
endif
" }

" Prepare statusline
" {
if has('statusline')
  set laststatus=2

  set statusline=%<%f\
 set statusline+=%w%h%m%r

  set statusline+=\ [%{&ff}/%Y]
  set statusline+=\ [%{getcwd()}]
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

map <Leader>n :NERDTreeToggle<CR>

map gn :bn<CR>
map gp :bp<CR>
map gd :bd<CR>

" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
"
" Airline Settings
" {
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
"}

" Colors
" {
set background=dark
colorscheme elflord
"}

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
