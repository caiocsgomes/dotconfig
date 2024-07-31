-- This will hold the configuration.
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
-- local os = require("os")
-- local session_manager = require("wezterm-session-manager/session-manager")
-- local act = wezterm.action
-- local mux = wezterm.mux

-- --------------------------------------------------------------------
-- FUNCTIONS AND EVENT BINDINGS
-- --------------------------------------------------------------------

-- Session Manager event bindings
-- See https://github.com/danielcopper/wezterm-session-manager
-- wezterm.on("save_session", function(window)
-- 	session_manager.save_state(window)
-- end)
-- wezterm.on("load_session", function(window)
-- 	session_manager.load_state(window)
-- end)
-- wezterm.on("restore_session", function(window)
-- 	session_manager.restore_state(window)
-- end)

-- For example, changing the color scheme:
-- config.color_scheme = "GruvboxDarkHard"
-- config.color_scheme = "MaterialOcean"
config.color_scheme = "Fira Code"
-- config.font = wezterm.font_with_fallback({
-- 	"GruvboxDarkHard",
-- })
config.font_size = 14

config.keys = {
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
	{ key = "LeftArrow", mods = "CMD", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{ key = "RightArrow", mods = "CMD", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "d", mods = "CMD", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "r", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
	-- {
	-- 	key = "c",
	-- 	mods = "LEADER",
	-- 	action = act.SpawnTab("CurrentPaneDomain"),
	-- },
	-- -- Attach to muxer
	-- {
	-- 	key = "a",
	-- 	mods = "LEADER",
	-- 	action = act.AttachDomain("unix"),
	-- },
	--
	-- -- Detach from muxer
	-- {
	-- 	key = "d",
	-- 	mods = "LEADER",
	-- 	action = act.DetachDomain({ DomainName = "unix" }),
	-- },
	-- -- Rename current session; analagous to command in tmux
	-- {
	-- 	key = "$",
	-- 	mods = "LEADER|SHIFT",
	-- 	action = act.PromptInputLine({
	-- 		description = "Enter new name for session",
	-- 		action = wezterm.action_callback(function(window, pane, line)
	-- 			if line then
	-- 				mux.rename_workspace(window:mux_window():get_workspace(), line)
	-- 			end
	-- 		end),
	-- 	}),
	-- },
	-- -- Show list of workspaces
	-- {
	-- 	key = "s",
	-- 	mods = "LEADER",
	-- 	action = act.ShowLauncherArgs({ flags = "WORKSPACES" }),
	-- },
}

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

config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = false })

-- and finally, return the configuration to wezterm
return config
