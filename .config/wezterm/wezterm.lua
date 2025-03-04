local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback {
  'GeistMono Nerd Font',
  'Font Awesome',
}
config.font_size = 20

config.color_scheme = 'Catppuccin Macchiato'
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.default_prog = { 'zsh', '-c', 'tmux attach || exec tmux' }
config.enable_tab_bar = false

return config
