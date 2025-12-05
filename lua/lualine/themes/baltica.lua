local c = require("baltica.palette").colors

local baltica_lualine = {
	normal = {
		a = { bg = c.electric_cyan, fg = c.abyss, gui = "bold" }, -- Jasny punkt orientacyjny
		b = { bg = c.abyss_layer, fg = c.foam_white },
		c = { bg = c.abyss, fg = c.sea_shadow }, -- Ciemne tło, tekst jak cień
	},
	insert = {
		a = { bg = c.plankton_green, fg = c.abyss, gui = "bold" }, -- Neonowa zieleń (Action)
		b = { bg = c.abyss_layer, fg = c.foam_white },
		c = { bg = c.abyss, fg = c.sea_shadow },
	},
	visual = {
		a = { bg = c.burning_amber, fg = c.abyss, gui = "bold" }, -- Bursztyn (Holding Data)
		b = { bg = c.abyss_layer, fg = c.foam_white },
		c = { bg = c.abyss, fg = c.sea_shadow },
	},
	replace = {
		a = { bg = c.rust_warning, fg = c.abyss, gui = "bold" }, -- Rdza (Destructive)
		b = { bg = c.abyss_layer, fg = c.foam_white },
		c = { bg = c.abyss, fg = c.sea_shadow },
	},
	command = {
		a = { bg = c.jellyfish_sting, fg = c.abyss, gui = "bold" }, -- Fiolet (Special)
		b = { bg = c.abyss_layer, fg = c.foam_white },
		c = { bg = c.abyss, fg = c.sea_shadow },
	},
	inactive = {
		a = { bg = c.abyss_layer, fg = c.sea_shadow, gui = "bold" },
		b = { bg = c.abyss_layer, fg = c.sea_shadow },
		c = { bg = c.abyss, fg = c.sea_shadow },
	},
}

return baltica_lualine
