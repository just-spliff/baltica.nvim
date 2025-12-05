local c = require("baltica.palette").colors

local baltica_lualine = {
	normal = {
		a = { bg = c.bio_venom, fg = c.void_main, gui = "bold" },
		b = { bg = c.void_float, fg = c.bio_venom },
		c = { bg = c.void_darker, fg = c.ghost_dim },
	},
	insert = {
		a = { bg = c.amber_core, fg = c.void_main, gui = "bold" },
		b = { bg = c.void_float, fg = c.amber_core },
		c = { bg = c.void_darker, fg = c.ghost_dim },
	},
	visual = {
		a = { bg = c.bio_electric, fg = c.void_main, gui = "bold" },
		b = { bg = c.void_float, fg = c.bio_electric },
		c = { bg = c.void_darker, fg = c.ghost_dim },
	},
	replace = {
		a = { bg = c.rust_blood, fg = c.void_main, gui = "bold" },
		b = { bg = c.void_float, fg = c.rust_blood },
		c = { bg = c.void_darker, fg = c.ghost_dim },
	},
	command = {
		a = { bg = c.ice_blue, fg = c.void_main, gui = "bold" },
		b = { bg = c.void_float, fg = c.ice_blue },
		c = { bg = c.void_darker, fg = c.ghost_dim },
	},
	inactive = {
		a = { bg = c.void_main, fg = c.sonar_grey, gui = "bold" },
		b = { bg = c.void_main, fg = c.sonar_grey },
		c = { bg = c.void_darker, fg = c.sonar_grey },
	},
}

return baltica_lualine
