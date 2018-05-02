set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set shell=/bin/bash

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'

  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
  Plugin 'scrooloose/nerdtree'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-syntastic/syntastic'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'rust-lang/rust.vim'
  Plugin 'vim-scripts/taglist.vim'
  Bundle 'blindFS/vim-taskwarrior'
call vundle#end()

"Visual settings
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
  set softtabstop=4
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

" execute pathogen#infect()

let g:ctrlp_working_path_mode = 0
" Prepare commandline
if has('cmdline_info')
  set ruler
  set rulerformat=%30($=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
  set showcmd
endif
" }

" Prepare statusline
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

"NERDTree
  map <Leader>n :NERDTreeToggle<CR>
  map <Leader>t :TlistToggle<CR>

let Tlist_Use_Right_Window=1

map gn :bn<CR>
map gp :bp<CR>
map gd :bd<CR>

"LaTeX Settings
  " LaTeX (rubber) macro for compiling
  nnoremap <leader>c :w<CR>:!cd $(dirname %) && rubber --pdf %:p<CR>
  " View PDF macro; '%:r' is current file's root (base) name.
  nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<c-Z>""
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsEditSplit="vertical"

  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
  let g:ycm_server_python_interpreter='/usr/bin/python'
  let g:ycm_add_preview_to_completeopt = 1
  let g:ycm_collect_identifiers_from_tags_files = 1
  let g:ycm_autoclose_preview_window_after_insertion = 1


" Airline Settings
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'bubblegum'

" Colors
if has('gui_running')
  colorscheme desert
  set background=dark
else
  set background=dark
  colorscheme elflord
endif

"Wincmds
  nmap <silent> <A-Up> :wincmd k<CR>
    nmap <silent> <A-Down> :wincmd j<CR>
  nmap <silent> <A-Left> :wincmd h<CR>
  nmap <silent> <A-Right> :wincmd l<CR>

" Folding settings
set foldmethod=syntax
set nofoldenable

let g:task_rc_override = 'rc.defaultwidth=0'
