" ==============================================================================
" Bindings 
" ==============================================================================
" Lambda calc
imap .lll <C-v>u03bb
imap .aaa <C-v>u03b1
imap .bbb <C-v>u03b2
imap .ccc <C-v>u03b3
imap .ddd <C-v>u03b4
imap .eee <C-v>u03b5
imap .fff <C-v>u03b6
imap .ggg <C-v>u03b7
imap .hhh <C-v>u03b8

imap .OOO <C-v>u03a9

" Comma
" ----------------------------------------------
" Juggling with buffers
" Comma, how you want to view the buffer, then b
" 'b' for buffer
nnoremap <leader>b :ls<CR>:buffer<Space>
nnoremap <leader>sb :ls<CR>:sbuffer<Space>
nnoremap <leader>vb :ls<CR>:vert sbuffer<Space>
nnoremap <leader><leader> :bnext<CR>
nnoremap <leader>bd :bd<CR>

" Juggling with files
" Same for opening new files<leader> just replace b with f (for recursive<leader> just like
" :find) or e (for non-recursive<leader> just like :edit)
" 'f' for find
" 'e' for edit
nnoremap <leader>e :edit<Space>
nnoremap <leader>se :split<Space>
nnoremap <leader>ve :vsplit<Space>

" Juggling with windows
" Same bindings for split/vsplit/tab as above<leader> just double the letter *or* wait
" for the timeout
nnoremap <leader>s :split<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>v :vsplit<CR>

" Close stuff
" 'c' for close
nnoremap <leader>c :close<CR>
" 'tc' for tabclose
nnoremap <leader>tc :tabclose<CR>

" Folding switches
nnoremap <leader>fm :set foldmethod=marker<CR>
nnoremap <leader>fi :set foldmethod=indent<CR>

" Space
" ----------------------------------------------

" Auto-indent the whole file
" 'i' for indent
nnoremap <Space>i mzgg=G`zzz

" Sort the current paragraph alphabetically
" 's' for sort
nnoremap <Space>s mzvip:sort<CR>`z

" Redraw the screen
" 'r' for redraw
nnoremap <Space>r :redraw!<CR>

" Run the linter/compiler
" 'm' for make
nnoremap <Space>m :update<CR>:make<CR>

" Quick 'n' easy find-and-replace
nnoremap <Space><Space> /<><CR>c2l
nnoremap <Space>c :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <Space>%       :%s/\<<C-r>=expand("<cword>")<CR>\>/
