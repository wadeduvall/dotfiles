local wezterm = require("wezterm")
local config = {
  -- Use the defaults as a base
  hyperlink_rules = wezterm.default_hyperlink_rules(),
  font = wezterm.font("JetBrains Mono"),
  audible_bell = "Disabled",
  -- color_scheme = "One Dark (Gogh)",
  color_scheme = "onedark",
  font_size = 11,
  use_fancy_tab_bar = false,
  window_background_opacity = 0.8,
}
return config
