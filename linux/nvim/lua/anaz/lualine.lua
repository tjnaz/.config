local status, lualine = pcall(require, "lualine")
if (not status) then return end


lualine.setup {
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {},
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  tabline = {

    lualine_a = { 'branch', 'location' },
    lualine_b = {
      {
        "buffers",
        symbols = { alternate_file = "" },
        mode = 2,
      },
    },
    lualine_c = {},
    lualine_x = { {
      'filename',
      file_status = true, -- display file status as in?
      path = 1, -- 0 = just the filename
    } },
    lualine_y = {},
    lualine_z = {
      { 'diagnostics', sources = { 'nvim_diagnostic' }, symbols = { error = " ", warn = " ", hint = " ",
        info = " " } },
      'encoding',
      'file',
      'filetype'
    },
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_z = {},
    lualine_y = {},
    lualine_x = {},
  }
  -- extensions = { 'gitsigns' },
}

lualine.hide({
  place = { 'statusline' },
  unhide = false,
})


-- --- CUSTOM THEME ---
-- local colors = {
--   none     = nil,
--   gray     = '#3C3C3C',
--   lightred = '#D16969',
--   blue     = '#569CD6',
--   pink     = '#C586C0',
--   black    = '#262626',
--   white    = '#D4D4D4',
--   green    = '#608B4E',
-- }
--
-- local transparent_theme = {
--   normal = {
--     b = { fg = colors.green, bg = colors.none },
--     a = { fg = colors.black, bg = colors.green, gui = 'bold' },
--     c = { fg = colors.white, bg = colors.none },
--   },
--   visual = {
--     b = { fg = colors.pink, bg = colors.none },
--     a = { fg = colors.black, bg = colors.pink, gui = 'bold' },
--   },
--   inactive = {
--     b = { fg = colors.black, bg = colors.none },
--     a = { fg = colors.white, bg = colors.gray, gui = 'bold' },
--   },
--   replace = {
--     b = { fg = colors.lightred, bg = colors.none },
--     a = { fg = colors.black, bg = colors.lightred, gui = 'bold' },
--     c = { fg = colors.white, bg = colors.none },
--   },
--   insert = {
--     b = { fg = colors.blue, bg = colors.none },
--     a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
--     c = { fg = colors.white, bg = colors.none },
--   },
-- }
--
