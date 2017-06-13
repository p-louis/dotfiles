" UI Settings
filetype plugin indent on

set encoding=utf-8
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

execute pathogen#infect()

let g:ctrlp_working_path_mode = 0
" Prepare commandline
if has('cmdline_info')
  set ruler
  set rulerformat=%30($=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
  set showcmd
endif

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

map <Leader>s :SyntasticToggleMode<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
    if has("unix")
        inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

map <Leader>n :NERDTreeToggle<CR>

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>


map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'


let g:Powerline_symbols = 'fancy'

" Colors
set background=light
colorscheme solarized
