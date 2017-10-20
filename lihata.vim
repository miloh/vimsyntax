" Vim syntax file
" Language:     lihata 
" Maintainer:   Ronald Miloh Alexander <miloh@froggytoad.net>

if version < 600
  syntax clear
elseif exists ("b:current_syntax")
  finish
endif


syn match lihataComment /^#.*/
syn match lihataNode /\s*li\|ha\|ta/ contains=lihataError
syn match lihataError /\s*\(li\|ha\|ta\)\s.\{-}:\s*/
syn match lihataNodeName /:\s*\zs\i*\ze\s*{/
syn match lihataKey /\s*\i*\s*=[^=]/ contains=lihataValue
syn match lihataValue /=[^=].*/ contained skipwhite
syn region lihataBlock start="{"  end="}" transparent fold

hi def link lihataComment Comment
hi def link lihataError Error
hi def link lihataNode Special
hi def link lihataNodeName Statement
hi def link lihataBlock Structure
hi def link lihataKey Function 
hi def link lihataValue String


let b:current_syntax = "lihata"
inoremap ( ()<Esc>i
inoremap { {<CR>}<Esc>kA
set complete=.,k
inoremap <C-Space> <C-P>
