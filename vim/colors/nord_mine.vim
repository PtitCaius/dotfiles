"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/nord.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "nord_mine"

hi! LineNr guibg=NONE
hi! Normal guibg=NONE
hi! VertSplit guibg=NONE
hi! SignColumn guibg=NONE
hi! CursorLineNr guibg=NONE
hi! link cDefine Define
hi! Folded guibg=NONE guifg=#616E88
hi! link cPreCondit Define
hi! Define guifg=#5E81AC
hi! Include guifg=#5E81AC
hi! link Macro Function
hi! Type guifg=#EBCB8B
hi! link LspCxxHlSymNamespace LspCxxHlSymClass
hi! link LspCxxHlSymField Normal
hi! link UndoTreeSavedBig Comment
hi! link UndoTreeSavedSmall Comment
hi! link UndotreeNode Statement
hi! link UndotreeNodeCurrent String
hi! link UndotreeCurrent String
hi! link UndoTreeBranch Define
hi! link IndentBlanklineContextChar Define
hi! link UndoTreeTimestamp sassClass
hi! link UndoTreeHead Function
hi! link Whitespace Define
hi! link texTitleArg String
hi! link CocSemClass Type
hi! link pandocPipeTableHeader pandocTableDelims
hi! link pandocDelimitedCodeBLock String
hi! IndentBlanklineChar cterm=nocombine ctermfg=8 gui=nocombine guifg=#434C5E
hi! link IndentBlanklineSpaceChar IndentBlanklineChar
hi! link texMathEnvArgName texEnvMArgName
hi! link DiagnosticError CocErrorSign
hi! link DiagnosticWarn CocWarningSign
hi! link DiagnosticInfo CocInfoSign
hi! link DiagnosticHint CocHintSign
hi! link CocFloating NormalFloat
hi! link CocFloatDividingLine Comment
hi! link CocSearch Search
