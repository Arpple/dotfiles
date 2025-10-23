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
    Normal { bg = background, fg = text },
    Cursor { fg = Normal.fg.darken(50), bg=Normal.bg.darken(50) },

    ColorColumn    { bg = background3 }, -- Columns set with 'colorcolumn'
    Conceal        { fg = gray2 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    CursorIM       { fg = background, bg = hsl(225, 17, 69) }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn   { bg = background2 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     { bg = hsl(0, 0, 15) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { Normal }, -- Directory names (and other special names in listings)
    ErrorMsg       { fg = red, gui = "bold,italic" }, -- Error messages on the command line
    VertSplit      { fg = background3, bg = background }, -- Column separating vertically split windows
    LineNr         { fg = background4 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove    { LineNr }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow    { LineNr }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { fg = gray5 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    ModeMsg        { fg = text, gui = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MoreMsg        { fg = teal }, -- |more-prompt|
    NormalFloat    { fg = text, bg = background2 }, -- Normal text in floating windows.
    FloatBorder    { fg = gray1, bg = background2 }, -- Border of floating windows.
    FloatTitle     { fg = Normal.fg }, -- Title of floating windows.
    NormalNC       { fg = text, bg = background }, -- normal text in non-current windows
    Question       { fg = teal }, -- |hit-enter| prompt and yes/no questions
    Search         { bg = green.darken(70) }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpellBad       { gui="undercurl", sp = red }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    StatusLine     { fg = text, bg = background2 }, -- Status line of current window
    StatusLineNC   { fg = background4, bg = background2 }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    Title          { fg = teal, gui = "bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { gui = "bold", bg = background4 }, -- Visual mode selection
    VisualNOS      { gui = "bold", bg = background4 }, -- Visual mode selection when vim is "Not Owning the Selection".
    Whitespace     { fg = Normal.fg.darken(50) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'

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
    Type           { fg = teal, gui = "bold" }, -- (*) int, long, char, etc.
    Special        {}, -- (*) Any special symbol
    Delimiter      { fg = Normal.fg.darken(50) }, --   Character that needs attention

    DiagnosticUnderlineError   { gui = "underline", sp = red } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { gui = "underline", sp = brightYellow } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnnecessary { DiagnosticUnderlineWarn },

    BufferLineCloseButton { fg = Normal.fg },
    BufferLineTab { fg = Normal.fg },
    BufferLineBufferVisible { fg = Normal.fg },
    BufferLineBuffer { fg = Normal.fg },
    BufferLineInfoVisible { fg = Normal.fg },
    BufferLineHintSelected { fg = green, bg = background4, gui = "underline" },
    BufferLineHint { fg = Normal.fg },
    BufferLineHintVisible { fg = Normal.fg },
    BufferLineWarning { fg = Normal.fg },
    BufferLineWarningVisible { fg = Normal.fg },
    BufferLineInfo { fg = Normal.fg },
    BufferLineFill { fg = Normal.fg },
    BufferLineError { fg = Normal.fg },
    BufferLineNumbers { fg = Normal.fg },
    BufferLineBackground { fg = Normal.fg },
    BufferLineTruncMarker { fg = Normal.fg },
    BufferLineTabSelected { bg = background4, gui = "" },

    -- Tree-Sitter syntax groups.
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
    sym"@lsp.typemod.interface.declaration.typescript" { declareType },
    sym"@lsp.typemod.parameter.declaration" { declareVariable },
    sym"@lsp.typemod.variable.declaration" { declareVariable },

    -- typescript
    sym"@tag.delimiter.tsx" { Delimiter },
    sym"@tag.builtin.tsx" { Type },

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

return theme
