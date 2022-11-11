local status, c = pcall(require, "catppuccin")
if (not status) then return end

c.setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
  transparent_background = true,
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  styles = {
    comments = { "italic", "bold" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {
    mocha = {
      text = "#00FF00",
    }
  },
  custom_highlights = {},
  highlight_overrides = {
    mocha = function(mocha)
      return {
        Comment = { fg = mocha.flamingo },
      }
    end,
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    }
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

vim.api.nvim_command "colorscheme catppuccin"

-- local status, n = pcall(require, "neosolarized")
-- if (not status) then return end
-- n.setup({
--   comment_italics = true,
-- })
-- -----------
-- local cb = require('colorbuddy.init')
-- local Color = cb.Color
-- local colors = cb.colors
-- local Group = cb.Group
-- local groups = cb.groups
-- local styles = cb.styles
--
-- Color.new('black', '#000000')
-- Color.new('nontext', '#212223')
-- Color.new('cursorline', '#001100')
-- Color.new('cursor', '#0F0')
-- Group.new('Cursor', cursor)
-- Group.new('NonText', colors.nontext)
-- Group.new('CursorLine', colors.none, colors.none, styles.undercurl, colors.base3)
-- Group.new('CursorLineNr', colors.yellow, colors.black, styles.bold, colors.base1)
-- Group.new('Visual', colors.none, colors.base03, styles.reverse)
--
-- local cError = groups.Error.fg
-- local cInfo = groups.Information.fg
-- local cWarn = groups.Warning.fg
-- local cHint = groups.Hint.fg
--
-- Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
-- Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
-- Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
-- Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)
