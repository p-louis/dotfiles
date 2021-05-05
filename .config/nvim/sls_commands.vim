autocmd FileType sls inoremap ;m {% macro <>(<>) -%}<CR><CR>{%- endmacro -%}
autocmd FileType sls inoremap ;v {{ <> }}
autocmd FileType sls inoremap ;i {% if <> -%}<CR><CR>{%- endif -%}
autocmd FileType sls inoremap ;f {% for <> in <> -%}<CR><CR>{%- endfor -%}

