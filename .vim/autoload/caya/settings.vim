scriptencoding utf-8

let s:middot='·'                " Middle Dot \u00b7
let s:raquo='»'                 " ANGLE QUOTATION MARK \u00bb
let s:small_l='ℓ'               " SCRIPT SMALL L \u2113

function! caya#settings#foldtext() abort
    let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
    let l:first=substitute(getline(v:foldstart), '\v *', '', '')
    let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
    return s:raquo . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction
