-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices
config.default_cursor_style = 'BlinkingBar'
config.default_prog = { '/usr/bin/fish', '-l' }
config.window_close_confirmation = 'NeverPrompt'
config.keys = {
  {
    key = 'r',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ReloadConfiguration,
  },
  {
    key = 'v',
    mods = 'CTRL',
    action = act.PasteFrom 'Clipboard'
  },
  {
    key = 'v',
    mods = 'CTRL',
    action = act.PasteFrom 'PrimarySelection'
  },
}
-- For example, changing the color scheme:
config.color_scheme = 'Ayu Mirage'

-- and finally, return the configuration to wezterm
return config
