local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = 'AdventureTime'
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.enable_tab_bar = false
config.window_padding ={
	-- left = 0;
	-- right = 0;
	-- top = 0;
	-- bottom = 0;
};

return config
