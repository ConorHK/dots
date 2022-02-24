local wezterm = require 'wezterm';
return {
  font = wezterm.font("creeper"),
  font_size = 10,
  color_scheme = "alduin",
  enable_tab_bar = false,
  color_schemes = {
    ["alduin"] = {
      foreground = "#dfdfaf",
      background = "#1c1c1c",
      cursor_bg = "#dfdfaf",
      cursor_fg = "#dfdfaf",
      cursor_border = "#e6d4a3",
      selection_fg = "#534a42",
      selection_bg = "#e6d4a3",
      ansi = {
        "#262626",
        "#af5f5f",
        "#87875f",
        "#af875f",
        "#878787",
        "#af8787",
        "#87afaf",
        "#dfdfaf",
      },
      brights = {
        "#626262",
        "#af5f5f",
        "#87875f",
        "#af875f",
        "#878787",
        "#af8787",
        "#87afaf",
        "#dfdfaf",
      },
    }
  },
}
