"Google style indent
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab
set textwidth=120
setlocal wrap
setlocal cindent
setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4
let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"
