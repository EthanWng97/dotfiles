version = "0.20.0"

local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path .. ";" .. xpm_path .. "/?.lua;" .. xpm_path .. "/?/init.lua"

os.execute(string.format("[ -e '%s' ] || git clone '%s' '%s'", xpm_path, xpm_url, xpm_path))

-- Plugins
xplr.config.modes.builtin.default.key_bindings.on_key.x = {
	help = "xpm",
	messages = {
		"PopMode",
		{ SwitchModeCustom = "xpm" },
	},
}

require("xpm").setup({
	auto_install = true,
	auto_cleanup = true,
	plugins = {
		-- Let xpm manage itself
		"dtomvan/xpm.xplr",
		"sayanarijit/tri-pane.xplr",
		"prncss-xyz/icons.xplr",
        "sayanarijit/zentable.xplr",
		{
			"sayanarijit/zoxide.xplr",
			setup = function()
				require("zoxide").setup({
					key = "z",
				})
			end,
		},

		{
			name = "sayanarijit/fzf.xplr",
			setup = function()
				require("fzf").setup({
					recursive = true,
					enter_dir = true,
				})
			end,
		},
	},
})

xplr.config.general.show_hidden = true
