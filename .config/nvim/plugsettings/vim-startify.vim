let g:startify_custom_header = [
        \ '    ____  __   ',
        \ '   / _ / / /   ',
        \ '  / __/ / /___ ',
        \ ' /_/   /_____/ ',
        \]


let g:startify_bookmarks = 1
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction

let g:startify_bookmarks = [
            \ { 'x': '~/.xmonad/xmonad.hs' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/projects/intellij',
            \ '~/projects/intellij/ionity',
            \ '~/projects/evaluation',
            \ '~/projects/category-theory',
            \ ]

let g:startify_enable_special = 0

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
