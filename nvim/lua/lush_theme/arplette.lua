--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`


local lush = require('lush')
local hsl = lush.hsl

-- Base colors
local text = hsl(0, 0, 100)           -- #ffffff
local background = hsl(0, 0, 10)      -- #111111
local background2 = hsl(0, 0, 13)     -- #222222
local background3 = hsl(0, 0, 20)     -- #333333
local background4 = hsl(0, 0, 27)     -- #444444

-- Accent colors
local red = hsl(0, 100, 60)           -- #ee1111 (not 40)
local orange = hsl(24, 99, 56)        -- #fd971f
local yellow = hsl(54, 78, 68)        -- #e6db74
local green = hsl(86, 100, 59)        -- #a6ff2e
local teal = hsl(180, 100, 50)        -- #00ffff (cyan)
local purple = hsl(300, 100, 40)      -- #cc00cc
local brightYellow = hsl(60, 100, 50)
local mint = hsl(161, 81, 57)

local lightOrange = hsl(24, 100, 93)
local lightGreen = hsl(86, 100, 93)
local lightMint = hsl(161, 100, 93)
local pink = hsl(300, 100, 80)         -- #f5c2e7

-- Gray scale
local gray1 = hsl(225, 10, 40)        -- #6c7086
local gray2 = hsl(227, 12, 56)        -- #7f849c
local gray3 = hsl(228, 15, 65)        -- #9399b2
local gray4 = hsl(230, 19, 74)        -- #bac2de
local gray5 = hsl(231, 24, 81)        -- #c8ccd4

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    Normal { bg = background, fg = text },
    Cursor { fg = Normal.fg.darken(50), bg=Normal.bg.darken(50), },

    ColorColumn    { bg = background3 }, -- Columns set with 'colorcolumn'
    Conceal        { fg = gray2 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM       { fg = background, bg = hsl(225, 17, 69) }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn   { bg = background2 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     { bg = hsl(0, 0, 15) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { Normal }, -- Directory names (and other special names in listings)
    -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
    -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
    -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg       { fg = red, gui = "bold,italic" }, -- Error messages on the command line
    VertSplit      { fg = background3, bg = background }, -- Column separating vertically split windows
    -- Folded         { }, -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    -- SignColumn     { }, -- Column where |signs| are displayed
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    LineNr         { fg = background4 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove    { LineNr }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow    { LineNr }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { fg = gray5 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    -- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg        { fg = text, gui = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        { fg = teal }, -- |more-prompt|
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalFloat    { fg = text, bg = background2 }, -- Normal text in floating windows.
    FloatBorder    { fg = gray1, bg = background2 }, -- Border of floating windows.
    FloatTitle     { fg = Normal.fg }, -- Title of floating windows.
    NormalNC       { fg = text, bg = background }, -- normal text in non-current windows
    -- Pmenu          { }, -- Popup menu: Normal item.
    -- PmenuSel       { }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    Question       { fg = teal }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       { gui="undercurl", sp = red }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     { fg = text, bg = background2 }, -- Status line of current window
    StatusLineNC   { fg = background4, bg = background2 }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    Title          { fg = teal, gui = "bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { gui = "bold", bg = background4 }, -- Visual mode selection
    VisualNOS      { gui = "bold", bg = background4 }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg     { }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WinSeparator   { fg = hsl(228, 25, 8) }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = brightYellow }, -- Any comment
    Constant       { fg = purple }, -- (*) Any constant
    String         { fg = yellow }, --   A string constant: "this is a string"
    Character      { fg = teal }, --   A character constant: 'c', '\n'
    Number         { fg = purple }, --   A number constant: 234, 0xff
    Identifier     { fg = text }, -- (*) Any variable name
    Function       { fg = text }, --   Function name (also: methods for classes)
    Operator       { fg = text }, --   "sizeof", "+", "*", etc.
    Keyword        { fg = red }, --   any other keyword
    Include        { Keyword }, --   Preprocessor #include

    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10
    -- Statement      { fg = lightRed }, -- (*) Any statement
    -- Conditional    { fg = lightRed }, --   if, then, else, endif, switch, etc.
    -- Repeat         { fg = lightRed }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Exception      { fg = lightRed }, --   try, catch, throw

    -- PreProc        { }, -- (*) Generic Preprocessor
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = teal, gui = "bold" }, -- (*) int, long, char, etc.

    Special        {}, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter      { fg = Normal.fg.darken(50) }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError   { gui = "underline", sp = red } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { gui = "underline", sp = brightYellow } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.
    DiagnosticUnnecessary { DiagnosticUnderlineWarn },

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    sym"@constant" { Identifier },
    sym"@string" { String },
    sym"@function" { Function },
    sym"@function.builtin" { Function },
    sym"@function.macro" { Function },
    sym"@parameter" { Normal },
    sym"@operator" { Operator },
    sym"@keyword" { Keyword },
    sym"@keyword.conditional.ternary" { Operator },
    sym"@variable" { Normal },
    sym"@variable.member" {  Identifier },
    sym"@type" { Type },
    sym"@type.definition" { Type },
    sym"@type.builtin" { Type },

    -- lsp semantic

    declareFunction { Function, fg = green, bg = green.darken(80) },
    declareType { Type, fg = teal, bg = teal.darken(80) },
    declareVariable { Identifier, fg = mint, bg = mint.darken(80) },

    sym"@lsp.typemod.function.declaration" { declareFunction },
    sym"@lsp.typemod.type.declaration" { declareType },
    sym"@lsp.typemod.namespace.declaration" { declareType },
    sym"@lsp.typemod.parameter.declaration" { declareVariable },
    sym"@lsp.typemod.variable.declaration" { declareVariable },

    -- typescript
    sym"@tag.delimiter.tsx" { Delimiter },
    sym"@tag.builtin.tsx" { Type },

    -- Snack Picker
    -- SnacksPickerIconNumber { Number },
    -- SnacksPickerIconNull { fg = green },
    -- SnacksPickerIconNamespace { fg = green },
    -- SnacksPickerIconModule { fg = green },
    -- SnacksPickerIconMethod { fg = green },
    -- SnacksPickerIconKey { fg = green },
    -- SnacksPickerIconInterface { fg = green },
    -- SnacksPickerIconFunction { fg = green },
    -- SnacksPickerIconFile { fg = green },
    -- SnacksPickerIcon { fg = green },
    -- SnacksPickerDirectory { fg = green },
    -- SnacksPickerDesc xxx links to Comment
    -- SnacksPickerDir { fg = green },
    -- SnacksPickerRegister xxx links to Number
    -- SnacksPickerDiagnosticSource xxx links to Comment
    -- SnacksPickerIconPackage { fg = green },
    -- SnacksPickerIconProperty { fg = green },
    -- SnacksPickerIconString { fg = green },
    -- SnacksPickerIconStruct { fg = green },
    -- SnacksPickerIconTypeParameter { fg = green },
    -- SnacksPickerIconVariable { fg = green },
    -- SnacksPickerSearch xxx links to Search
    -- SnacksPickerComment xxx links to Comment
    -- SnacksPickerGitStatusDeleted xxx links to Removed
    -- SnacksPickerPrompt xxx links to Special
    -- SnacksPickerUndoAdded xxx links to Added
    -- SnacksPickerAuEvent xxx links to Constant
    -- SnacksPickerMatch xxx links to Special
    -- SnacksPickerSelected xxx links to Number
    -- SnacksPickerAuPattern xxx links to String
    -- SnacksPickerSpecial xxx links to Special
    -- SnacksPickerInputSearch xxx links to @keyword
    -- SnacksPickerDelim xxx links to Delimiter
    -- SnacksPickerTotals xxx links to NonText
    -- SnacksPickerLink xxx links to Comment
    -- SnacksPickerLinkBroken xxx links to DiagnosticError
    -- SnacksPickerPathIgnored xxx links to NonText
    -- SnacksPickerPathHidden xxx links to NonText
    -- SnacksPickerToggle xxx links to DiagnosticVirtualTextInfo
    -- SnacksPickerRow xxx links to String
    -- SnacksPickerCode xxx links to @markup.raw.markdown_inline
    -- SnacksPickerFile { fg = Normal.fg },
    -- SnacksPickerGitStatus xxx links to Special
    -- SnacksPickerGitStatusAdded { fg = green },

    MiniIconsBlue  { fg = teal },
    MiniIconsPurple { fg = purple },
    MiniIconsYellow { fg = brightYellow },
    MiniIconsRed { fg = red },
    MiniIconsOrange { fg = orange },
    MiniIconsGrey  { fg = gray1 },
    MiniIconsGreen { fg = green },
    MiniIconsCyan { fg = teal },
    MiniIconsAzure { fg = teal },
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
