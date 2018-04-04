" Vim syntax file
" Language:     lihata 
" Maintainer:   Ronald Miloh Alexander <miloh@froggytoad.net>

if version < 600
  syntax clear
elseif exists ("b:current_syntax")
  finish
endif


" lihata {type:name}={content};
" te, li, ha, ta, sy

syn keyword lihataNodeTypes li ha ta te sy nextgroup=lihataNodeName
syn match lihataNodeName /:\s*\zs\i\p*\ze\s*{/ contains=lihataError
syn match lihataError /\s\{-}\ze:/
syn region lihataBlock start='{' end='}' transparent fold
syn match lihataComment /\(^#\|\s*#\).*/

hi def link lihataComment Comment
hi def link lihataError Error
hi def link lihataNodeTypes Type
hi def link lihataNodeName Identifier

let b:current_syntax = "lihata"
inoremap ( ()<Esc>i
inoremap { {<CR>}<Esc>kA
set complete=.,k
inoremap <C-Space> <C-P>
