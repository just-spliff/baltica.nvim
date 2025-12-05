local c = require("baltica.palette").colors

-- Styl: Ciemny pasek, kolorowe akcenty tylko na tekście i ikonach.
local baltica_lualine = {
	normal = {
		a = { bg = c.bg_float, fg = c.cyan_neon, gui = "bold" }, -- Tylko tekst świeci
		b = { bg = c.bg_main, fg = c.fg_main },
		c = { bg = c.bg_main, fg = c.ui_line_nr },
	},
	insert = {
		a = { bg = c.bg_float, fg = c.green_bio, gui = "bold" },
		b = { bg = c.bg_main, fg = c.fg_main },
		c = { bg = c.bg_main, fg = c.ui_line_nr },
	},
	visual = {
		a = { bg = c.bg_float, fg = c.amber_bright, gui = "bold" },
		b = { bg = c.bg_main, fg = c.fg_main },
		c = { bg = c.bg_main, fg = c.ui_line_nr },
	},
	replace = {
		a = { bg = c.bg_float, fg = c.error, gui = "bold" },
		b = { bg = c.bg_main, fg = c.fg_main },
		c = { bg = c.bg_main, fg = c.ui_line_nr },
	},
	command = {
		a = { bg = c.bg_float, fg = c.amber_dark, gui = "bold" },
		b = { bg = c.bg_main, fg = c.fg_main },
		c = { bg = c.bg_main, fg = c.ui_line_nr },
	},
	inactive = {
		a = { bg = c.bg_main, fg = c.ui_line_nr, gui = "bold" },
		b = { bg = c.bg_main, fg = c.ui_line_nr },
		c = { bg = c.bg_main, fg = c.ui_line_nr },
	},
}

return baltica_lualine
