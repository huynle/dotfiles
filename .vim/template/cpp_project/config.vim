" ####### Auto Completion

let g:mucomplete#enable_auto_at_startup = 1
let g:syntastic_check_on_open = 1

" on save
let b:enable_rsync  = 1

" VNC server
let b:rsync_server  = "vnc3"
let b:rsync_remote  = "~/vpuh/devver"

" " ## VTB2 SERVER
" let b:rsync_server  = "vtb2"
" let b:rsync_remote  = "~/src/devver"

" DON't end with forward slash
let b:rsync_local   = "/cygdrive/c/Users/e367212/"."src/devver"

let b:rsync_exclude = ".project/rsync_exclude"

""" for make in vim
setlocal makeprg=make\ check

"""""""" clang formatting
let g:clang_format#style_options = {
      \ "AccessModifierOffset": -2,
      \ "ConstructorInitializerIndentWidth": 4,
      \ "AlignEscapedNewlinesLeft": "false",
      \ "AlignTrailingComments": "true",
      \ "AllowAllParametersOfDeclarationOnNextLine": "true",
      \ "AllowShortIfStatementsOnASingleLine": "false",
      \ "AllowShortLoopsOnASingleLine": "false",
      \ "AlwaysBreakTemplateDeclarations": "false",
      \ "AlwaysBreakBeforeMultilineStrings": "false",
      \ "BreakBeforeBinaryOperators": "false",
      \ "BreakBeforeTernaryOperators": "true",
      \ "BreakConstructorInitializersBeforeComma": "false",
      \ "BinPackParameters": "true",
      \ "ColumnLimit": 160,
      \ "ConstructorInitializerAllOnOneLineOrOnePerLine": "false",
      \ "DerivePointerBinding": "false",
      \ "ExperimentalAutoDetectBinPacking": "false",
      \ "IndentCaseLabels": "false",
      \ "MaxEmptyLinesToKeep": 1,
      \ "NamespaceIndentation": "None",
      \ "ObjCSpaceBeforeProtocolList": "true",
      \ "PenaltyBreakBeforeFirstCallParameter": 19,
      \ "PenaltyBreakComment": 60,
      \ "PenaltyBreakString": 1000,
      \ "PenaltyBreakFirstLessLess": 120,
      \ "PenaltyExcessCharacter": 1000000,
      \ "PenaltyReturnTypeOnItsOwnLine": 60,
      \ "PointerBindsToType": "true",
      \ "SpacesBeforeTrailingComments": 1,
      \ "Cpp11BracedListStyle": "false",
      \ "Standard": "C++11",
      \ "IndentWidth": 4,
      \ "TabWidth": 8,
      \ "UseTab": "Never",
      \ "BreakBeforeBraces": "Allman",
      \ "IndentFunctionDeclarationAfterType": "false",
      \ "SpacesInParentheses": "false",
      \ "SpacesInAngles":  "false",
      \ "SpaceInEmptyParentheses": "false",
      \ "SpacesInCStyleCastParentheses": "false",
      \ "SpaceAfterControlStatementKeyword": "true",
      \ "SpaceBeforeAssignmentOperators": "true",
      \ "ContinuationIndentWidth": 4,}
