local wezterm = require 'wezterm'
local config = {}

config.automatically_reload_config = true

config.font = wezterm.font("CaskaydiaMonoNerdFont")
config.font_size = 10
config.enable_tab_bar = false


config.colors = {
  background = '{{colors.background.default.hex}}',
  foreground = '{{colors.on_background.default.hex}}',
  cursor_border = '{{colors.background.default.hex}}',
  cursor_bg = '{{colors.on_background.default.hex}}',
  selection_fg = '{{colors.on_surface.default.hex}}',
  selection_bg = '{{colors.surface_variant.default.hex}}',

  scrollbar_thumb = '{{colors.inverse_surface.default.hex}}',
  split = '{{colors.secondary.default.hex}}',

  ansi = {
    '{{colors.surface_variant.default.hex}}',
    '{{colors.inverse_surface.default.hex}}',
    '{{colors.tertiary.default.hex}}',
    '{{colors.tertiary.default.hex}}',
    '{{colors.inverse_primary.default.hex}}',
    '{{colors.secondary.default.hex}}',
    '{{colors.primary.default.hex}}',
    '{{colors.on_surface.default.hex}}',
  },
  brights = {
      '{{colors.surface_variant.default.hex}}',
      '{{colors.inverse_surface.default.hex}}',
      '{{colors.tertiary.default.hex}}',
      '{{colors.tertiary.default.hex}}',
      '{{colors.inverse_primary.default.hex}}',
      '{{colors.secondary.default.hex}}',
      '{{colors.primary.default.hex}}',
      '{{colors.on_surface.default.hex}}',
  },
}

config.window_padding = {
  left = 25,
  right = 25,
  top = 20,
  bottom = 20,
}

config.default_cursor_style = "SteadyBar"

return config
