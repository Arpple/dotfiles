-- return {
--   { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
--
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--     init = function()
--       local function augroup(name)
--         return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
--       end
--       vim.api.nvim_create_autocmd("VimEnter", {
--         group = augroup("highlight_syntax"),
--         callback = function()
--           vim.api.nvim_set_hl(0, "Comment", { fg = "#ffff00" })
--         end,
--       })
--     end,
--   },
-- }

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      term_colors = true,
      transparent_background = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          -- this 16 colors are changed to onedark
          base = "#111111",
          mantle = "#222222",
          surface0 = "#333333",
          surface1 = "#444444",
          surface2 = "#444444",
          text = "#ffffff",
          rosewater = "#b6bdca",
          lavender = "#c8ccd4",
          red = "#F92672",
          peach = "#d19a66",
          yellow = "#E6DB74",
          green = "#A6FF2E",
          teal = "#56b6c2",
          blue = "#66D9EF",
          mauve = "#c678dd",
          flamingo = "#be5046",
          mint = "#3BDAAF",

          -- now patching extra palettes
          maroon = "#e06c75",
          sky = "#d19a66",

          -- extra colors not decided what to do
          pink = "#F5C2E7",
          sapphire = "#74C7EC",

          subtext1 = "#BAC2DE",
          subtext0 = "#A6ADC8",
          overlay2 = "#9399B2",
          overlay1 = "#7F849C",
          overlay0 = "#6C7086",

          highlight = "#ffff00",
          bg_match = "#4b3a2b",

          crust = "#11111B",
          -- mantle = "#000000",
          -- crust = "#000000",
        },
      },
      highlight_overrides = {
        mocha = function(colors)
          return {
            -- CmpItemMenu = { fg = colors.surface2 },
            -- CursorLineNr = { fg = colors.text },
            -- FloatBorder = { bg = colors.base, fg = colors.surface0 },
            -- GitSignsChange = { fg = colors.peach },
            -- LineNr = { fg = colors.overlay0 },
            -- LspInfoBorder = { link = "FloatBorder" },
            -- NeoTreeDirectoryIcon = { fg = colors.subtext1 },
            -- NeoTreeDirectoryName = { fg = colors.subtext1 },
            -- NeoTreeFloatBorder = { bg = colors.mantle, fg = colors.mantle },
            -- -- NeoTreeFloatBorder = { bg = "None" },
            -- NeoTreeGitConflict = { fg = colors.red },
            -- NeoTreeGitDeleted = { fg = colors.red },
            -- NeoTreeGitIgnored = { fg = colors.overlay0 },
            -- NeoTreeGitModified = { fg = colors.peach },
            -- NeoTreeGitStaged = { fg = colors.green },
            -- NeoTreeGitUnstaged = { fg = colors.red },
            -- NeoTreeGitUntracked = { fg = colors.green },
            -- NeoTreeIndent = { fg = colors.surface1 },
            -- NeoTreeNormal = { bg = colors.mantle },
            -- NeoTreeNormalNC = { bg = colors.mantle },
            -- NeoTreeRootName = { fg = colors.subtext1, style = { "bold" } },
            -- NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
            -- NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
            -- NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
            -- NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
            -- NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
            -- NormalFloat = { bg = colors.base },
            -- Pmenu = { bg = colors.mantle, fg = "" },
            -- telescope prompt
            TelescopeMatching = { fg = colors.highlight, bg = colors.bg_match },
            TelescopePromptTitle = { fg = colors.mantle, bg = "#39fd9c", style = { "bold" } },
            TelescopePromptCounter = { fg = colors.red, style = { "bold" } },
            TelescopePromptBorder = { bg = colors.base },
            -- telescope results
            TelescopeResultsTitle = { link = "TelescopePromptTitle" },
            TelescopeResultsBorder = { link = "TelescopePromptBorder" },
            TelescopeResultsComment = { fg = colors.text },
            -- telescope preview
            TelescopePreviewTitle = { link = "TelescopePromptTitle" },
            TelescopePreviewBorder = { link = "TelescopePromptBorder" },
            VertSplit = { bg = colors.base, fg = colors.surface0 },
            WhichKeyFloat = { bg = colors.mantle },
            YankHighlight = { bg = colors.surface2 },
            FidgetTask = { fg = colors.subtext2 },
            FidgetTitle = { fg = colors.peach },

            FlashCurrent = { fg = colors.yellow, bg = colors.bg_match },
            FlashMatch = { fg = colors.yellow, bg = colors.bg_match },

            --
            -- IblIndent = { fg = colors.surface0 },
            -- IblScope = { fg = colors.overlay0 },
            --
            -- Boolean = { fg = colors.mauve },
            -- Number = { fg = colors.mauve },
            -- Float = { fg = colors.mauve },
            --
            -- PreProc = { fg = colors.mauve },
            -- PreCondit = { fg = colors.mauve },
            Include = { fg = colors.mauve },
            -- Define = { fg = colors.mauve },
            Conditional = { fg = colors.red },
            Repeat = { fg = colors.red },
            Keyword = { fg = colors.red },
            Typedef = { fg = colors.blue },
            Exception = { fg = colors.red },
            Statement = { fg = colors.red },
            --
            -- Error = { fg = colors.red },
            Highlight = { fg = colors.highlight },
            -- StorageClass = { fg = colors.peach },
            -- Tag = { fg = colors.peach },
            -- Label = { fg = colors.peach },
            -- Structure = { fg = colors.peach },
            -- Operator = { fg = colors.peach },
            -- Title = { fg = colors.peach },
            -- Special = { fg = colors.yellow },
            -- SpecialChar = { fg = colors.yellow },
            Type = { fg = colors.blue, style = { "bold" } },
            Function = { fg = colors.green },
            -- Delimiter = { fg = colors.subtext2 },
            -- Ignore = { fg = colors.subtext2 },
            -- Macro = { fg = colors.teal },
            -- Comment = { fg = "#ffff00" },
            String = { fg = colors.yellow },

            -- DiagnosticUnderlineWarn = { style = "italic" },
            DiagnosticUnnecessary = { link = "DiagnosticUnderlineWarn", style = { "italic" } },

            --
            -- TSAnnotation = { fg = colors.mauve },
            -- TSAttribute = { fg = colors.mauve },
            -- TSBoolean = { fg = colors.mauve },
            -- TSCharacter = { fg = colors.teal },
            -- TSCharacterSpecial = { link = "SpecialChar" },
            TSComment = { fg = "#ffff00" },
            -- TSConditional = { fg = colors.red },
            -- TSConstBuiltin = { fg = colors.mauve },
            -- TSConstMacro = { fg = colors.mauve },
            -- TSConstant = { fg = colors.text },
            -- TSConstructor = { fg = colors.green },
            -- TSDebug = { link = "Debug" },
            -- TSDefine = { link = "Define" },
            -- TSEnvironment = { link = "Macro" },
            -- TSEnvironmentName = { link = "Type" },
            -- TSError = { link = "Error" },
            -- TSException = { fg = colors.red },
            -- TSField = { fg = colors.blue },
            -- TSFloat = { fg = colors.mauve },
            -- TSFuncBuiltin = { fg = colors.green },
            -- TSFuncMacro = { fg = colors.green },
            TSFunction = { link = "Function" },
            -- TSFunctionCall = { fg = colors.green },
            -- TSInclude = { fg = colors.red },
            TSKeyword = { fg = colors.red },
            TSKeywordFunction = { fg = colors.red },
            TSKeywordOperator = { fg = colors.red },
            TSKeywordReturn = { fg = colors.red },
            -- TSLabel = { fg = colors.peach },
            -- TSLiteral = { link = "String" },
            -- TSMath = { fg = colors.blue },
            -- TSMethod = { fg = colors.green },
            -- TSMethodCall = { fg = colors.green },
            -- TSNamespace = { fg = colors.yellow },
            -- TSNone = { fg = colors.text },
            -- TSNumber = { fg = colors.mauve },
            -- TSOperator = { fg = colors.peach },
            TSParameter = { fg = colors.text },
            -- TSParameterReference = { fg = colors.text },
            -- TSPreProc = { link = "PreProc" },
            TSProperty = { fg = colors.mint },
            -- TSPunctBracket = { fg = colors.text },
            -- TSPunctDelimiter = { link = "Delimiter" },
            -- TSPunctSpecial = { fg = colors.blue },
            -- TSRepeat = { fg = colors.red },
            -- TSStorageClass = { fg = colors.peach },
            -- TSStorageClassLifetime = { fg = colors.peach },
            -- TSStrike = { fg = colors.subtext2 },
            TSString = { fg = colors.yellow },
            -- TSStringEscape = { fg = colors.green },
            -- TSStringRegex = { fg = colors.green },
            -- TSStringSpecial = { link = "SpecialChar" },
            -- TSSymbol = { fg = colors.text },
            -- TSTag = { fg = colors.peach },
            -- TSTagAttribute = { fg = colors.green },
            -- TSTagDelimiter = { fg = colors.green },
            -- TSText = { fg = colors.green },
            -- TSTextReference = { link = "Constant" },
            -- TSTitle = { link = "Title" },
            -- TSTodo = { link = "Todo" },
            TSType = { link = "Typedef" },
            -- TSTypeBuiltin = { fg = colors.yellow, style = { "bold" } },
            -- TSTypeDefinition = { fg = colors.yellow, style = { "bold" } },
            -- TSTypeQualifier = { fg = colors.peach, style = { "bold" } },
            -- TSURI = { fg = colors.blue },
            TSVariable = { fg = colors.text },
            TSVariableBuiltin = { fg = colors.peach },
            --
            -- ["@annotation"] = { link = "TSAnnotation" },
            -- ["@attribute"] = { link = "TSAttribute" },
            -- ["@boolean"] = { link = "TSBoolean" },
            -- ["@character"] = { link = "TSCharacter" },
            -- ["@character.special"] = { link = "TSCharacterSpecial" },
            -- ["@comment"] = { link = "TSComment" },
            -- ["@conceal"] = { link = "Grey" },
            -- ["@conditional"] = { link = "TSConditional" },
            -- ["@constant"] = { link = "TSConstant" },
            -- ["@constant.builtin"] = { link = "TSConstBuiltin" },
            -- ["@constant.macro"] = { link = "TSConstMacro" },
            -- ["@constructor"] = { link = "TSConstructor" },
            -- ["@debug"] = { link = "TSDebug" },
            -- ["@define"] = { link = "TSDefine" },
            -- ["@error"] = { link = "TSError" },
            -- ["@exception"] = { link = "TSException" },
            -- ["@field"] = { link = "TSField" },
            -- ["@float"] = { link = "TSFloat" },
            -- ["@function"] = { link = "TSFunction" },
            -- ["@function.builtin"] = { link = "TSFuncBuiltin" },
            -- ["@function.call"] = { link = "TSFunctionCall" },
            -- ["@function.macro"] = { link = "TSFuncMacro" },
            -- ["@include"] = { link = "TSInclude" },
            ["@keyword"] = { link = "TSKeyword" },
            ["@keyword.function"] = { link = "TSKeywordFunction" },
            ["@keyword.operator"] = { link = "TSKeywordOperator" },
            ["@keyword.return"] = { link = "TSKeywordReturn" },
            ["@keyword.export"] = { link = "Include" },
            -- ["@label"] = { link = "TSLabel" },
            -- ["@math"] = { link = "TSMath" },
            -- ["@method"] = { link = "TSMethod" },
            -- ["@method.call"] = { link = "TSMethodCall" },
            ["@module"] = { link = "TSVariable" },
            -- ["@namespace"] = { link = "TSNamespace" },
            -- ["@none"] = { link = "TSNone" },
            -- ["@number"] = { link = "TSNumber" },
            -- ["@operator"] = { link = "TSOperator" },
            ["@parameter"] = { link = "TSParameter" },
            -- ["@parameter.reference"] = { link = "TSParameterReference" },
            -- ["@preproc"] = { link = "TSPreProc" },
            ["@property"] = { link = "TSProperty" },
            -- ["@punctuation.bracket"] = { link = "TSPunctBracket" },
            -- ["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
            -- ["@punctuation.special"] = { link = "TSPunctSpecial" },
            -- ["@repeat"] = { link = "TSRepeat" },
            -- ["@storageclass"] = { link = "TSStorageClass" },
            -- ["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
            -- ["@strike"] = { link = "TSStrike" },
            -- ["@string"] = { link = "TSString" },
            -- ["@string.escape"] = { link = "TSStringEscape" },
            -- ["@string.regex"] = { link = "TSStringRegex" },
            -- ["@string.special"] = { link = "TSStringSpecial" },
            -- ["@symbol"] = { link = "TSSymbol" },
            -- ["@tag"] = { link = "TSTag" },
            -- ["@tag.attribute"] = { link = "TSTagAttribute" },
            -- ["@tag.delimiter"] = { link = "TSTagDelimiter" },
            -- ["@text"] = { link = "TSText" },
            -- ["@text.danger"] = { link = "TSDanger" },
            -- ["@text.diff.add"] = { link = "diffAdded" },
            -- ["@text.diff.delete"] = { link = "diffRemoved" },
            -- ["@text.emphasis"] = { link = "TSEmphasis" },
            -- ["@text.environment"] = { link = "TSEnvironment" },
            -- ["@text.environment.name"] = { link = "TSEnvironmentName" },
            -- ["@text.literal"] = { link = "TSLiteral" },
            -- ["@text.math"] = { link = "TSMath" },
            -- ["@text.note"] = { link = "TSNote" },
            -- ["@text.reference"] = { link = "TSTextReference" },
            -- ["@text.strike"] = { link = "TSStrike" },
            -- ["@text.strong"] = { link = "TSStrong" },
            -- ["@text.title"] = { link = "TSTitle" },
            -- ["@text.todo"] = { link = "TSTodo" },
            -- ["@text.todo.checked"] = { link = "Green" },
            -- ["@text.todo.unchecked"] = { link = "Ignore" },
            -- ["@text.underline"] = { link = "TSUnderline" },
            -- ["@text.uri"] = { link = "TSURI" },
            -- ["@text.warning"] = { link = "TSWarning" },
            -- ["@todo"] = { link = "TSTodo" },
            ["@type"] = { link = "TSType" },
            ["@type.builtin"] = { link = "TSType" },
            -- ["@type.definition"] = { link = "TSTypeDefinition" },
            -- ["@type.qualifier"] = { link = "TSTypeQualifier" },
            -- ["@uri"] = { link = "TSURI" },
            ["@variable"] = { link = "TSVariable" },
            ["@variable.builtin"] = { link = "TSVariableBuiltin" },
            ["@variable.parameter"] = { link = "TSParameter" },
            ["@variable.member"] = { link = "TSVariable" },
            --
            --
            ["@lsp.type.class"] = { link = "TSType" },
            -- ["@lsp.type.comment"] = { fg = "#ffff00" },
            -- ["@lsp.type.decorator"] = { link = "TSFunction" },
            -- ["@lsp.type.enum"] = { link = "TSType" },
            -- ["@lsp.type.enumMember"] = { link = "TSProperty" },
            -- ["@lsp.type.events"] = { link = "TSLabel" },
            -- ["@lsp.type.function"] = { link = "TSFunction" },
            ["@lsp.type.interface"] = { link = "TSType" },
            -- ["@lsp.type.keyword"] = { link = "TSKeyword" },
            -- ["@lsp.type.macro"] = { link = "TSConstMacro" },
            -- ["@lsp.type.method"] = { link = "TSMethod" },
            -- ["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
            -- ["@lsp.type.namespace"] = { link = "TSNamespace" },
            -- ["@lsp.type.number"] = { link = "TSNumber" },
            -- ["@lsp.type.operator"] = { link = "TSOperator" },
            -- ["@lsp.type.parameter"] = { link = "TSParameter" },
            -- ["@lsp.type.property"] = { link = "TSProperty" },
            -- ["@lsp.type.regexp"] = { link = "TSStringRegex" },
            -- ["@lsp.type.string"] = { link = "TSSTring" },
            -- ["@lsp.type.struct"] = { link = "TSType" },
            -- ["@lsp.type.type"] = { link = "TSType" },
            -- ["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
            -- ["@lsp.type.variable"] = { link = "TSVariable" },

            -- lua
            ["@comment.lua"] = { link = "Highlight" },
            ["@constructor.lua"] = { link = "punctuation.bracket" },
            ["@variable.lua"] = { link = "TSVariable" },
            ["@variable.member.lua"] = { link = "TSProperty" },
            ["@lsp.type.property.lua"] = { link = "TSProperty" },
            ["@lsp.type.comment.lua"] = { link = "@comment.lua" },

            -- javascript
            ["@comment.javascript"] = { link = "Highlight" },

            -- typescript
            ["@comment.typescript"] = { link = "Highlight" },
            ["@comment.documentation.typescript"] = { link = "Highlight" },
            ["@lsp.type.namespace.typescript"] = { link = "TSType" },
            ["@constructor.typescript"] = { link = "TSType" },
            ["@punctuation.special.typescript"] = { link = "TSPunctBracket" },
            ["@variable.member.typescript"] = { link = "TSProperty" },
          }
        end,
      },
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
    -- init = function()
    --   local function augroup(name)
    --     return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
    --   end
    --   vim.api.nvim_create_autocmd("VimEnter", {
    --     group = augroup("highlight_syntax"),
    --     callback = function()
    --       vim.api.nvim_set_hl(0, "Comment", { fg = "#ffff00" })
    --     end,
    --   })
    -- end,
  },
}
