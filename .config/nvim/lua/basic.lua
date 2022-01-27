-- local set = vim.opt

-- set.termguicolors=true
-- set.tabstop=2
-- set.shiftwidth=2
-- set.expandtab=true
-- set.smarttab=true
-- set.autoindent=true
-- set.incsearch=true 
-- set.ignorecase=true 
-- set.smartcase=true 
-- set.hlsearch=true
-- set.wildmode={longestlist,full,wildmenu}
-- set.textwidth=0

-- require("sidebar-nvim").setup({
--     disable_default_keybindings = 0,
--     bindings = nil,
--     open = false,
--     side = "left",
--     initial_width = 35,
--     hide_statusline = false,
--     update_interval = 1000,
--     sections = { "datetime", "git", "diagnostics", require("dap-sidebar-nvim.breakpoints"), "conatiners"},
--     section_separator = "-----",
--     containers = {
--         attach_shell = "/bin/sh", show_all = true, interval = 5000,
--     },
--     datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
--     todos = { ignored_paths = { "~" } },
--     disable_closing_prompt = false
-- })

local user_profile = require("user_profile")

local sidebar = require("sidebar-nvim")
sidebar.setup({
	open = true,
	initial_width = 40,
	enable_profile = false,
	sections = user_profile.with_profile_table({
		default = { "git", "diagnostics", "containers", "files" },
		test = {
			"git",
			"diagnostics",
			"symbols",
			"files",
			"containers",
			"todos",
		},
		work = { "git", "diagnostics", "files" },
	}),
	datetime = { clocks = { { name = "Local" }, { tz = "America/Los_Angeles" }, { tz = "Etc/UTC" } } },
	todos = { initially_closed = true },
})