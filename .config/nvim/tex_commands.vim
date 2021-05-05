autocmd FileType tex inoremap ;s \section{<>}<CR>\label{sec:<>}
autocmd FileType tex inoremap ;ss \subsection{<>}\label{ssec:<>}

autocmd FileType tex inoremap ;p \begin{proof}<CR><><CR>\end{proof}
autocmd FileType tex inoremap ;t \begin{prooftree}<CR><><CR>\end{prooftree}
autocmd FileType tex inoremap ;ta \AxiomC{$<>$}
autocmd FileType tex inoremap ;tu \UnaryInfC{$<>$}
autocmd FileType tex inoremap ;tb \BinaryInfC{$<>$}
autocmd FileType tex inoremap ;tt \TrinaryInfC{$<>$}

autocmd FileType tex inoremap ;m \begin{align}<CR><><CR>\end{align} 
autocmd FileType tex inoremap ;ca \alpha
autocmd FileType tex inoremap ;cb \beta
autocmd FileType tex inoremap ;cc \gamma

autocmd FileType tex inoremap ;i \begin{itemize}<CR><><CR>\end{itemize}
autocmd FileType tex inoremap ;it \item 

autocmd FileType tex inoremap <> <>

nnoremap <leader>cc :!pdflatex %<CR>
