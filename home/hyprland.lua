-- Monitor Configuration
hl.monitor({
	output = "DP-3",
	mode = "2560x1440@144",
	position = "0x0",
})

hl.monitor({
	output = "DP-2",
	mode = "2560x1440@144",
	position = "2560x0",
})

-- General Settings
hl.config({
	general = {
		border_size = 0,
		gaps_in = 4,
		gaps_out = 10,
	},
})

-- Decoration
hl.config({
	decoration = {
		rounding = 6,
	},
})

-- Input
hl.config({
	input = {
		kb_layout = "de",
		follow_mouse = 1,
	},
})

-- Miscc
hl.config({
	misc = {
		force_default_wallpaper = 1,
		disable_hyprland_logo = true,
	},
})

-- Animationdefaults
hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 3,
	bezier = "default",
	style = "popin",
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 3,
	bezier = "default",
})

hl.animation({
	leaf = "specialWorkspace",
	enabled = true,
	speed = 3,
	bezier = "default",
	style = "slide bottom",
})

-- Exec Once
hl.on("hyprland.start", function()
	hl.exec_cmd("hlctl setcursor Future 20")
	hl.exec_cmd("udiskie &")
	hl.exec_cmd("[workspace 2 silent] pear-desktop")
	hl.exec_cmd("[workspace 2 silent] discord")
end)

-- Variables
local mod = "SUPER"

-- Binds
hl.bind("Print", hl.dsp.exec_cmd("hlshot --freeze --mode region -o ~/Pictures/Screenshots"))
hl.bind(mod .. " + Print", hl.dsp.exec_cmd("hlshot -m output -m active -o ~/Pictures/Screenshots"))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + Q", hl.dsp.exec_cmd("alacritty"))
hl.bind(mod .. " + ALT + END", hl.dsp.exit())
hl.bind(mod .. " + L", hl.dsp.exec_cmd("noctalia msg session lock"))
hl.bind(mod .. " + C", hl.dsp.window.close({}))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))
hl.bind(mod .. " + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + space", hl.dsp.exec_cmd("vicinae toggle"))

-- Workspaces
hl.bind(mod .. " + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind(mod .. " + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind(mod .. " + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind(mod .. " + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind(mod .. " + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind(mod .. " + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind(mod .. " + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind(mod .. " + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind(mod .. " + 9", hl.dsp.focus({ workspace = "9" }))
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = "0" }))

--	{ mod, "m", "togglespecialworkspace", "music" },

-- Navigation
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move to Workspace
hl.bind(mod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = "1" }))
hl.bind(mod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = "2" }))
hl.bind(mod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = "3" }))
hl.bind(mod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = "4" }))
hl.bind(mod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = "5" }))
hl.bind(mod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = "6" }))
hl.bind(mod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = "7" }))
hl.bind(mod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = "8" }))
hl.bind(mod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = "9" }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "0" }))

-- Move Window
hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

hl.bind(mod .. " + CTRL + left", hl.dsp.window.move({ monitor = "right" }))
hl.bind(mod .. " + CTRL + right", hl.dsp.window.move({ monitor = "left" }))

-- Mouse Binds
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize())

-- Window Rules
hl.window_rule({
	name = "Ubisoft Connect",
	match = {
		initial_class = "^upc.exe$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	name = "JetBrains Splash & Welcome",
	match = {
		initial_class = "^jetbrains-.*$",
		initial_title = "^(Splash|Welcome to.*)$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	name = "Obsidian",
	match = {
		initial_class = "^(.*obsidian.*)$",
	},
	float = true,
	center = true,
	pin = true,
})

hl.window_rule({
	name = "Pulsemeeter",
	match = {
		initial_class = "^(.*pulsemeeter.*)$",
	},
	float = true,
	center = true,
})
