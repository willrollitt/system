" Vim color scheme
"
" Name:       greenisgood.vim
" Maintainer: Rafael Francischini <rafinha.unix@gmail.com>
" License:    MIT

set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'greenisgood'

let s:white  = ['White', 15]
let s:black  = ['#0e1111', 16]
let s:bgray  = ['#181818', 233]
let s:lgray  = ['LightGray', 255]
let s:cgray  = ['#737373', 243]
let s:dgray  = ['DarkGray', 248]
let s:sgreen  = ['#326739', 121]
let s:yellow = ['Yellow', 226]
let s:red    = ['#b6403a', 160]
let s:green  = ['#03a062', 28]
let s:xgreen  = ['#00cd00', 29]

let s:default_fg = s:white
let s:default_bg = s:black

let s:italic    = 'italic'
let s:bold      = 'bold'
let s:underline = 'underline'
let s:none      = 'NONE'

let s:default_lst = []
let s:default_str = ''

if !exists("g:monochrome_italic_comments")
  let g:monochrome_italic_comments = 0
endif
let s:comment_attr = g:monochrome_italic_comments ? s:italic : s:none

function! s:hi(...)
    let group = a:1
    let fg    = get(a:, 2, s:default_fg)
    let bg    = get(a:, 3, s:default_bg)
    let attr  = get(a:, 4, s:default_str)

    let cmd = ['hi', group]

    if fg != s:default_lst
        call add(cmd, 'guifg='.fg[0])
        call add(cmd, 'ctermfg='.fg[1])
    endif

    if bg != s:default_lst
        call add(cmd, 'guibg='.bg[0])
        call add(cmd, 'ctermbg='.bg[1])
    endif

    if attr != s:default_str
        call add(cmd, 'gui='.attr)
        call add(cmd, 'cterm='.attr)
    endif

    exec join(cmd, ' ')
endfunction


"
" --- Vim interface ------------------------------------------------------------
"

call s:hi('Normal')
call s:hi('Cursor', s:black, s:lgray)
call s:hi('CursorLine', s:default_lst, s:bgray, s:none)
call s:hi('CursorLineNr', s:white, s:default_bg, s:bold)
call s:hi('ColorColumn', s:default_fg, s:bgray)
call s:hi('Search', s:white, s:xgreen)
call s:hi('Visual', s:white, s:xgreen)
call s:hi('ErrorMsg', s:white, s:red)

" Tildes at the bottom of a buffer, etc.
call s:hi('NonText', s:dgray)

" Folding.
call s:hi('FoldColumn', s:dgray)
call s:hi('Folded')

" Line numbers gutter.
call s:hi('LineNr', s:dgray)

" Small arrow used for tabs.
call s:hi('SpecialKey', s:sgreen, s:default_bg, s:bold)

" File browsers.
call s:hi('Directory', s:white, s:default_bg, s:bold)

" Help.
call s:hi('helpSpecial')
call s:hi('helpHyperTextJump', s:xgreen, s:default_bg, s:underline)
call s:hi('helpNote')

" Popup menu.
call s:hi('Pmenu', s:white, s:xgreen)
call s:hi('PmenuSel', s:xgreen, s:white)

" Notes.
call s:hi('Todo', s:black, s:yellow, s:bold)


"
" --- Programming languages ----------------------------------------------------
"

call s:hi('Statement', s:white, s:default_bg, s:bold)
call s:hi('PreProc', s:white, s:default_bg, s:bold)
call s:hi('String', s:sgreen)
call s:hi('Comment', s:cgray, s:default_bg, s:comment_attr)
call s:hi('Constant')
call s:hi('Type', s:white, s:default_bg, s:bold)
call s:hi('Function', s:white)
call s:hi('Identifier')
call s:hi('Special')
call s:hi('MatchParen', s:black, s:lgray)


"
" --- VimL ---------------------------------------------------------------------
"

call s:hi('vimOption')
call s:hi('vimGroup')
call s:hi('vimHiClear')
call s:hi('vimHiGroup')
call s:hi('vimHiAttrib')
call s:hi('vimHiGui')
call s:hi('vimHiGuiFgBg')
call s:hi('vimHiCTerm')
call s:hi('vimHiCTermFgBg')
call s:hi('vimSynType')
hi link vimCommentTitle Comment


"
" --- Ruby ---------------------------------------------------------------------
"

call s:hi('rubyConstant')
call s:hi('rubySharpBang', s:cgray)
call s:hi('rubyStringDelimiter', s:sgreen)
call s:hi('rubyStringEscape', s:sgreen)
call s:hi('rubyRegexpEscape', s:sgreen)
call s:hi('rubyRegexpAnchor', s:sgreen)
call s:hi('rubyRegexpSpecial', s:sgreen)


"
" --- Elixir -------------------------------------------------------------------
"

call s:hi('elixirAlias', s:default_fg, s:default_bg, s:none)
call s:hi('elixirDelimiter', s:sgreen)
call s:hi('elixirSelf', s:default_fg, s:default_bg, s:none)

" For ||, ->, etc.
call s:hi('elixirOperator')

" Module attributes like @doc or @type.
hi link elixirVariable Statement

" While rendered as comments in other languages, docstrings are strings,
" experimental.
hi link elixirDocString String
hi link elixirDocTest String
hi link elixirStringDelimiter String


"
" --- Perl ---------------------------------------------------------------------
"

call s:hi('perlSharpBang', s:cgray)
call s:hi('perlStringStartEnd', s:sgreen)
call s:hi('perlStringEscape', s:sgreen)
call s:hi('perlMatchStartEnd', s:sgreen)


"
" --- Python -------------------------------------------------------------------
"

call s:hi('pythonEscape', s:sgreen)


"
" --- JavaScript ---------------------------------------------------------------
"

call s:hi('javaScriptFunction', s:white, s:default_bg, s:bold)


"
" --- Diffs --------------------------------------------------------------------
"

call s:hi('diffFile', s:cgray)
call s:hi('diffNewFile', s:cgray)
call s:hi('diffIndexLine', s:cgray)
call s:hi('diffLine', s:cgray)
call s:hi('diffSubname', s:cgray)
call s:hi('diffAdded', s:white, s:green)
call s:hi('diffRemoved', s:white, s:red)


"
" --- Markdown -----------------------------------------------------------------
"

call s:hi('Title', s:white, s:default_bg, s:bold)
call s:hi('markdownHeadingDelimiter', s:white, s:default_bg, s:bold)
call s:hi('markdownHeadingRule', s:white, s:default_bg, s:bold)
call s:hi('markdownLinkText', s:sgreen, s:default_bg, s:underline)


"
" --- vim-fugitive -------------------------------------------------------------
"

call s:hi('gitcommitComment', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitOnBranch', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitBranch', s:sgreen, s:default_bg, s:none)
call s:hi('gitcommitHeader', s:white, s:default_bg, s:bold)
call s:hi('gitcommitSelected', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitDiscarded', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitSelectedType', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitDiscardedType', s:default_fg, s:default_bg, s:none)


"
" --- NeoMake ------------------------------------------------------------------
"

call s:hi('NeomakeMessageSign')
call s:hi('NeomakeWarningSign', s:sgreen)
call s:hi('NeomakeErrorSign', s:yellow)
call s:hi('NeomakeInfoSign')
call s:hi('NeomakeError', s:yellow)
call s:hi('NeomakeInfo', s:default_fg, s:default_bg, s:bold)
call s:hi('NeomakeMessage')
call s:hi('NeomakeWarning', s:yellow)
