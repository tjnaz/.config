local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local dimmer = { brightness = 0.5 }

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

-- wezterm.on('update-status', function(window, pane)
--   local overrides = pane:get_config_overrides() or {}
--   if pane:is_focused() then
--     overrides.color_scheme = 'Batman'
--   else
--     overrides.color_scheme = 'tokyonight-storm'
--   end
--   pane:set_config_overrides(overrides)
-- end)

return {
  color_scheme = "Batman",
  cursor_blink_rate = 500,
  cursor_blink_ease_in = "Linear",
  cursor_blink_ease_out = "Linear",
  native_macos_fullscreen_mode = true,
  custom_block_glyphs = true,
  font_size = 16.0,
  dpi = 96.0,
  audible_bell = "Disabled",
  font = wezterm.font({
    family = "FiraCode Nerd Font"
  }),
  font_rules = {
    {
      italic = true,
      font = wezterm.font("Cascadia Code", { italic = true })
    },
    {
      italic = true,
      intensity = "Bold",
      font = wezterm.font("Cascadia Code", {
        italic = true,
        weight = "Bold"
      })
    },
  },
  font_shaper = "Harfbuzz",
  --font_shaper = "Allsorts",
  --font_antialias = "Subpixel",
  harfbuzz_features = {
    "kern",
    "liga",
    "clig",
    "calt",
    "cv112",
    "cv01",
    "cv02",
    "cv06",
    "ss01",
    "cv14",
    "cv17",
    "cv16",
    "cv31",
    "cv29",
    "cv30",
    "cv18",
    "cv25",
    "cv32",
    "cv28",
    "cv27",
    "ss07",
    "ss07",
    "ss10",
    "ss02",
    "cv19",
    "cv23",
    "cv22",
    "cv24",
    "ss09",
  },
  font_antialias = "Greyscale",
  font_hinting = "Full",
  -- Window Configurations --
  window_padding = {
    left = 10,
    right = 10,
    top = 20,
    bottom = 0,
  },
  ------------------
  ------------------
  enable_tab_bar = false,
  colors = {
    cursor_bg = '#0F0',
    scrollbar_thumb = 'white',
  },
  enable_scroll_bar = false,
  -- window_background_opacity = 0.3,
  background = {
    -- This is the deepest/back-most layer. It will be rendered first
    {
      source = {
        File = '/Users/anaz/Documents/misc/background/cyberpunk-1.jpg',
      },
      -- The texture tiles vertically but not horizontally.
      -- When we repeat it, mirror it so that it appears "more seamless".
      -- An alternative to this is to set `width = "100%"` and have
      -- it stretch across the display
      -- repeat_x = 'Mirror',
      -- window_background_opacity = 1.0,
      repeat_x = 'NoRepeat',
      repeat_y = 'NoRepeat',
      vertical_align = 'Middle',
      horizontal_align = 'Center',
      opacity = 0.8,
      hsb = {
        brightness = 0.1,
      },
      width = '200%',
      height = '200%',
      vertical_offset = '8%',
      horizontal_offset = '-2%',
      -- When the viewport scrolls, move this layer 10% of the number of
      -- pixels moved by the main viewport. This makes it appear to be
      -- further behind the text.
      attachment = { Parallax = 0.0 },
    },
    {
      source = {
        File = '/Users/anaz/Documents/misc/background/terminal/ring-elvis-1.jpg',
      },
      -- The texture tiles vertically but not horizontally.
      -- When we repeat it, mirror it so that it appears "more seamless".
      -- An alternative to this is to set `width = "100%"` and have
      -- it stretch across the display
      -- repeat_x = 'Mirror',
      -- window_background_opacity = 1.0,
      opacity = 0.5,
      hsb = {
        brightness = 0.5,
      },
      -- When the viewport scrolls, move this layer 10% of the number of
      -- pixels moved by the main viewport. This makes it appear to be
      -- further behind the text.
      attachment = { Parallax = 0.0 },
    },
    {
      source = {
        File = '/Users/anaz/Documents/misc/background/bg_space_images/Objects/space_object_anomaly@2x.png',
      },
      -- The texture tiles vertically but not horizontally.
      -- When we repeat it, mirror it so that it appears "more seamless".
      -- An alternative to this is to set `width = "100%"` and have
      -- it stretch across the display
      repeat_x = 'NoRepeat',
      repeat_y = 'NoRepeat',
      vertical_align = 'Middle',
      horizontal_align = 'Center',
      height = '50%',
      width = '50%',
      vertical_offset = '-2%',
      horizontal_offset = '2%',
      -- window_background_opacity = 1.0,
      opacity = 0.6,
      hsb = {
        brightness = 0.1,
      },
      -- When the viewport scrolls, move this layer 10% of the number of
      -- pixels moved by the main viewport. This makes it appear to be
      -- further behind the text.
      attachment = { Parallax = 0.0 },
    },
  },
  ------------------
  ------------------
  keys = {
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
  enable_scroll_bar = false,
  -- bold_brightens_ansi_colors = true,
}
