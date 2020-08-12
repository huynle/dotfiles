"""""""""""""" This file has to do with syntax and formatting

" """"" Syntastic
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_check_no_defaults_include_dirs = 0
let g:syntastic_cpp_auto_refresh_includes = 1
" let g:syntastic_cpp_include_dirs = [ 'includes', 'headers' ]
" let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_config_file = '.clang_complete'

""" Python stuff
let g:syntastic_python_checkers = ['pylint']

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["cpp", "py"],
    \ "passive_filetypes": ["rbql"] }



 " Toggle auto syntax checking
nmap <Leader><Leader>ss :SyntasticToggleMode<CR>

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
      \ "ColumnLimit": 80,
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
      \ "PointerBindsToType": "false",
      \ "SpacesBeforeTrailingComments": 1,
      \ "Cpp11BracedListStyle": "false",
      \ "Standard": "C++11",
      \ "IndentWidth": 2,
      \ "TabWidth": 8,
      \ "UseTab": "Never",
      \ "BreakBeforeBraces": "Attach",
      \ "IndentFunctionDeclarationAfterType": "false",
      \ "SpacesInParentheses": "false",
      \ "SpacesInAngles":  "false",
      \ "SpaceInEmptyParentheses": "false",
      \ "SpacesInCStyleCastParentheses": "false",
      \ "SpaceAfterControlStatementKeyword": "true",
      \ "SpaceBeforeAssignmentOperators": "true",
      \ "ContinuationIndentWidth": 4,}

"" run clang format  when selecting and pressing equal
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer>= :ClangFormat<CR>

" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

 " Toggle auto formatting:
nmap <Leader>><Leader>ff :ClangFormatAutoToggle<CR>
