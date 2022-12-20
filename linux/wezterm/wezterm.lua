local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local cusHSB = {
  brightness = 0.7,
  hue = 0.0,
  saturation = 3.5,
}

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

wezterm.on('toggle-ligature', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.harfbuzz_features then
    -- else we did already, and we should disable out override now
    overrides.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
  else
    -- If we haven't overridden it yet, then override with ligatures disabled
    overrides.harfbuzz_features = nil
  end
  window:set_config_overrides(overrides)
end)

------------------------------------------------------------------------------------
-- ---WHEN YOU WANT THE WINDOW TO BE TINTED WHEN SWITCHING TO A DIFFERENT APP ------
-- wezterm.on('update-status', function(window, pane)
--   local overrides = window:get_config_overrides() or {}
--   if window:is_focused() then
--     overrides.window_background_opacity = 0.5
--   else
--     overrides.window_background_opacity = 2.2
--   end
--   window:set_config_overrides(overrides)
-- end)


------------------------------------------------------------------------------------

--- TRIED CHANING THE BACKGROUND IMAGE TO NIL WHEN THE WINDOW IS NOT AT A MAXIMIZED STATE ---
-- function toggle_background_image(window)
--   local window_dims = window:get_dimensions()
--   local overrides = window:get_config_overrides() or {}

--   if not window_dims.is_full_screen then
--     overrides.window_background_image = "/Users/anaz/Documents/misc/background/terminal/cyberpunk-2.jpg"
--   end
-- end

-- wezterm.on('window-resized', function(window, pane)
--   toggle_background_image(window)
-- end)

-- wezterm.on('window-config-reloaded', function(window)
--   toggle_background_image(window)
-- end)
------------------------------------------------------------------------------------

return {
  use_ime = false,
  window_decorations = "RESIZE",
  cursor_blink_rate = 500,
  -- cursor_blink_ease_in = "Linear",
  -- cursor_blink_ease_out = "Linear",
  cursor_thickness = 3.0,
  custom_block_glyphs = true,
  underline_position = -9.0,
  underline_thickness = 2.0,
  font_size = 16.0,
  dpi = 96.0,
  audible_bell = "Disabled",
  -- Window Configurations --
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  ------------------
  ------------------
  enable_tab_bar = false,
  colors = {
    cursor_bg = '#0F0',
  },
  enable_scroll_bar = false,
  -- Some sort of residue appearing on the window ---
  -- background = {
  --   {
  --     source = {
  --       File = '/Users/anaz/Documents/misc/background/terminal/ring-elvis-1-png.png',
  --     },
  --     hsb = cusHSB,
  --     opacity = 0.5,
  --   },
  -- },
  window_background_image = "/home/anaz/Pictures/lotr.png",
  window_background_opacity = 0.4,
  window_background_image_hsb = cusHSB,
  font = wezterm.font 'FiraCode Nerd Font',
  font_rules = {
    {
      italic = true,
      font = wezterm.font {
        family = 'Cascadia Code',
        style = "Italic",
        weight = 'ExtraLight',
        harfbuzz_features = { 'calt = 0', 'clig=0', 'liga=0' },
      },
      -- How is the new font>??
    },
  },
  font_shaper = "Harfbuzz",
  harfbuzz_features = {
    "calt",
    "clig",
    "cv01",
    "cv02",
    "cv04",
    "cv08",
    "cv12",
    "cv14",
    "cv16",
    -- "cv17",
    "cv18",
    -- "cv19",
    -- "cv22",
    -- "cv23",
    "cv24",
    "cv25",
    "cv26",
    "cv28",
    "cv30",
    "cv32",
    "kern",
    "liga",
    "ss01",
    "ss02",
    "ss03",
    "ss04",
    "ss06",
    "ss07",
    "ss08",
    "ss09",
    "ss10",
  },
  font_antialias = "Greyscale",
  font_hinting = "Full",
  keys = {
    {
      key = 'w',
      mods = 'CTRL',
      action = wezterm.action.EmitEvent 'toggle-ligature',
    },
    {
      key = "f",
      mods = "SHIFT|CTRL",
      action = wezterm.action.ToggleFullScreen,
      -- action = wezterm.action.Maximize,
    },
  },
  mouse_bindings = {
    -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.CompleteSelection 'PrimarySelection',
    },
    -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
    {
      event = { Down = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.Nop,
    },

    -- and make CTRL-Click open hyperlinks
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
    },
    -- Scrolling up/down while holding CTRL increases/deacrease the font size
    {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = 'CTRL',
      action = act.IncreaseFontSize,
    },
    {
      event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = 'CTRL',
      action = act.DecreaseFontSize,
    },
    {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = 'NONE',
      action = act.ScrollByLine(1),
    },
    {
      event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = 'NONE',
      action = act.ScrollByLine(-1),
    },
  },
  scrollback_lines = 3500,
  bold_brightens_ansi_colors = true,
  hyperlink_rules = {
    -- Linkify things that look like URLs and the host has a TLD name.
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
      format = '$0',
    },

    -- linkify email addresses
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
      format = 'mailto:$0',
    },

    -- file:// URI
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = [[\bfile://\S*\b]],
      format = '$0',
    },

    -- Linkify things that look like URLs with numeric addresses as hosts.
    -- E.g. http://127.0.0.1:8000 for a local development server,
    -- or http://192.168.1.1 for the web interface of many routers.
    {
      regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
      format = '$0',
    },

    -- Make task numbers clickable
    -- The first matched regex group is captured in $1.
    {
      regex = [[\b[tT](\d+)\b]],
      format = 'https://example.com/tasks/?t=$1',
    },

    -- Make username/project paths clickable. This implies paths like the following are for GitHub.
    -- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
    -- As long as a full URL hyperlink regex exists above this it should not match a full URL to
    -- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
    {
      regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
      format = 'https://www.github.com/$1/$3',
    },
  },
}
