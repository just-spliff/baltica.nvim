local M = {}

function M.setup(config)
	local c = require("ba  ltica.palette").colors
	local opts = config.options

	local bg = opts.transparent_background and c.none or c.void_main
	local bg_float = opts.transparent_background and c.none or c.void_float

	local groups = {
		-- --- ATMOSPHERE (UI) ---
		Normal = { fg = c.ghost_white, bg = bg },
		NormalNC = { fg = c.ghost_white, bg = bg },
		NormalFloat = { fg = c.ghost_white, bg = bg_float },
		FloatBorder = { fg = c.bio_electric, bg = bg_float },

		Cursor = { fg = c.void_main, bg = c.bio_venom },
		CursorLine = { bg = c.void_float },
		CursorLineNr = { fg = c.bio_venom, bold = true },
		LineNr = { fg = c.sonar_grey },
		SignColumn = { bg = bg },
		VertSplit = { fg = c.void_darker, bg = c.void_darker },
		ColorColumn = { bg = c.void_float },

		Visual = { bg = c.selection_glaze },
		Search = { fg = c.void_main, bg = c.amber_core },
		IncSearch = { fg = c.void_main, bg = c.bio_electric },

		Pmenu = { fg = c.ghost_white, bg = c.void_float },
		PmenuSel = { fg = c.void_main, bg = c.bio_venom, bold = true },
		PmenuSbar = { bg = c.void_float },
		PmenuThumb = { bg = c.glass_frame },

		-- --- THE STORY (Syntax) ---

		-- TŁO (Cisza)
		Comment = { fg = c.sonar_grey, italic = opts.italics.comments },
		Delimiter = { fg = c.sonar_grey },
		Operator = { fg = c.ice_blue },

		-- STRUKTURA (Lód/Woda)
		Keyword = { fg = c.ice_blue, italic = opts.italics.keywords },
		Statement = { fg = c.ice_blue },
		Conditional = { fg = c.ice_blue },
		Repeat = { fg = c.ice_blue },
		Include = { fg = c.ice_blue },

		-- ŻYCIE (Neon)
		Function = { fg = c.bio_venom, bold = opts.bold.functions },
		Method = { fg = c.bio_venom, bold = opts.bold.functions },
		Type = { fg = c.bio_electric, bold = opts.bold.types },
		Structure = { fg = c.bio_electric },
		Constructor = { fg = c.bio_electric },

		-- DANE (Bursztyn - Skarb)
		String = { fg = c.amber_core, italic = opts.italics.strings },
		Character = { fg = c.amber_core },
		Number = { fg = c.amber_glass },
		Boolean = { fg = c.amber_core, bold = true },
		Constant = { fg = c.amber_core },

		-- NEUTRALNE
		Identifier = { fg = c.ghost_white },

		-- SPECJALNE
		Special = { fg = c.bio_electric },
		PreProc = { fg = c.glass_frame },

		-- --- TREESITTER ---
		["@variable"] = { fg = c.ghost_white },
		["@variable.builtin"] = { fg = c.ice_blue },
		["@variable.parameter"] = { fg = c.amber_glass },

		["@function"] = { fg = c.bio_venom, bold = opts.bold.functions },
		["@function.builtin"] = { fg = c.bio_electric },

		["@keyword"] = { fg = c.ice_blue },
		["@keyword.function"] = { fg = c.ice_blue },
		["@keyword.return"] = { fg = c.rust_blood, bold = true },

		["@type.builtin"] = { fg = c.bio_electric },

		-- HTML / JSX / TSX
		["@tag"] = { fg = c.ice_blue },
		["@tag.attribute"] = { fg = c.ghost_dim },
		["@tag.delimiter"] = { fg = c.sonar_grey },
		["@property"] = { fg = c.ghost_white },

		-- JSON / CSS
		["@property.json"] = { fg = c.bio_electric },
		["@property.css"] = { fg = c.bio_electric },

		-- DIAGNOSTYKA
		DiagnosticError = { fg = c.rust_blood },
		DiagnosticWarn = { fg = c.warning_beam },
		DiagnosticInfo = { fg = c.bio_electric },
		DiagnosticHint = { fg = c.sonar_grey },
		DiagnosticUnderlineError = { undercurl = true, sp = c.rust_blood },

		-- GIT SIGNS
		GitSignsAdd = { fg = c.bio_venom },
		GitSignsChange = { fg = c.warning_beam },
		GitSignsDelete = { fg = c.rust_blood },
	}

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
