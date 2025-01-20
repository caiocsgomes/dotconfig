local wezterm = require("wezterm")
-- local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
config.color_scheme = "Dark Pastel"
config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = false })
config.font_size = 14
config.animation_fps = 1
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
	-- {
	--   key = "s",
	--   mods = "CMD",
	--   action = wezterm.action_callback(function(win, pane)
	--     resurrect.save_state(resurrect.workspace_state.get_workspace_state())
	--   end),
	-- },
	-- {
	--   key = "W",
	--   mods = "ALT",
	--   action = resurrect.window_state.save_window_action(),
	-- },
	-- {
	--   key = "T",
	--   mods = "ALT",
	--   action = resurrect.tab_state.save_tab_action(),
	-- },
	-- {
	--   key = "s",
	--   mods = "ALT",
	--   action = wezterm.action_callback(function(win, pane)
	--     resurrect.save_state(resurrect.workspace_state.get_workspace_state())
	--     resurrect.window_state.save_window_action()
	--   end),
	-- },
	-- {
	--   key = "r",
	--   mods = "CMD",
	--   action = wezterm.action_callback(function(win, pane)
	--     resurrect.fuzzy_load(win, pane, function(id, label)
	--       local type = string.match(id, "^([^/]+)") -- match before '/'
	--       id = string.match(id, "([^/]+)$")         -- match after '/'
	--       id = string.match(id, "(.+)%..+$")        -- remove file extention
	--       local opts = {
	--         relative = true,
	--         restore_text = true,
	--         on_pane_restore = resurrect.tab_state.default_on_pane_restore,
	--       }
	--       if type == "workspace" then
	--         local state = resurrect.load_state(id, "workspace")
	--         resurrect.workspace_state.restore_workspace(state, opts)
	--       elseif type == "window" then
	--         local state = resurrect.load_state(id, "window")
	--         resurrect.window_state.restore_window(pane:window(), state, opts)
	--       elseif type == "tab" then
	--         local state = resurrect.load_state(id, "tab")
	--         resurrect.tab_state.restore_tab(pane:tab(), state, opts)
	--       end
	--     end)
	--   end),
	-- },
}
return config
