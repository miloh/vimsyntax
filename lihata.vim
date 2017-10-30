" Vim syntax file
" Language:     lihata 
" Maintainer:   Ronald Miloh Alexander <miloh@froggytoad.net>

if version < 600
  syntax clear
elseif exists ("b:current_syntax")
  finish
endif


" lihata {type:name}={content};
" te, li, ha, ta, symlink

syn match lihataNodeName /:\s*\zs\i\p*\ze\s*{/
syn match lihataTextNode /\s*te\ze\(\s\|:\)/ contains=lihataError
syn match lihataListNode /\s*li\ze\(\s\|:\)/ contains=lihataError
syn match lihataHashNode /\s*ha\ze\(\s\|:\)/ contains=lihataError
syn match lihataTableNode /\s*ta\ze\(\s\|:\)/ contains=lihataError
syn match lihataSymlinkNode /\s*sy\ze\(\s\|:\)/ contains=lihataError 
syn match lihataError /\s*\(li\|ha\|ta\)\s.\{-}:\s*/
syn match lihataKey /\s*\i\p*\s*\ze=\s*\i\p*/ 
syn match lihataValue /=[^=]\zs.*\ze;/ skipwhite
syn region lihataBlock start="{"  end="}" transparent fold
syn match lihataComment /\(^#\|\s*#\).*/ 

hi def link lihataComment Comment
hi def link lihataError Error
hi def link lihataTextNode Special
hi def link lihataListNode Special
hi def link lihataHashNode Special
hi def link lihataSymlinkNode Special
hi def link lihataTableNode Special
hi def link lihataNodeName Function 
hi def link lihataBlock Structure
hi def link lihataKey Statement
hi def link lihataValue String


let b:current_syntax = "lihata"
inoremap ( ()<Esc>i
inoremap { {<CR>}<Esc>kA
set complete=.,k
inoremap <C-Space> <C-P>
