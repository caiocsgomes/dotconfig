local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
config.audible_bell = "Disabled"
config.color_scheme = "Dark Pastel"
config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = false })
config.font_size = 14
config.animation_fps = 240
config.max_fps = 240
config.leader = {
	key = "a",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}
config.unix_domains = {
	{
		name = "unix",
	},
}

config.keys = {
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	{ key = "LeftArrow", mods = "CMD", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{ key = "RightArrow", mods = "CMD", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "r",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act.SendKey({
			key = "b",
			mods = "ALT",
		}),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act.SendKey({ key = "f", mods = "ALT" }),
	},
}
return config
