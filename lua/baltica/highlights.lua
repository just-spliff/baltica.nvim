local M = {}

function M.setup(config)
	local c = require("baltica.palette").colors
	local opts = config.options

	local bg = opts.transparent_background and c.none or c.bg_main
	local bg_float = opts.transparent_background and c.none or c.bg_float

	local groups = {
		-- --- UI: CINEMATIC DARKNESS ---
		Normal = { fg = c.fg_main, bg = bg },
		NormalNC = { fg = c.fg_main, bg = bg },
		NormalFloat = { fg = c.fg_main, bg = bg_float },
		FloatBorder = { fg = c.ui_border, bg = bg_float },

		Cursor = { fg = c.bg_main, bg = c.ui_cursor },
		CursorLine = { bg = c.bg_float },
		CursorLineNr = { fg = c.cyan_neon, bold = true },
		LineNr = { fg = c.ui_line_nr },

		SignColumn = { bg = bg },
		VertSplit = { fg = c.ui_border, bg = c.none },
		WinSeparator = { fg = c.ui_border, bg = c.none },

		Visual = { bg = c.bg_visual },
		Search = { fg = c.bg_main, bg = c.amber_bright, bold = true },
		IncSearch = { fg = c.bg_main, bg = c.cyan_neon },

		Pmenu = { fg = c.fg_main, bg = c.bg_float },
		PmenuSel = { fg = c.bg_main, bg = c.green_bio, bold = true },
		PmenuSbar = { bg = c.bg_float },
		PmenuThumb = { bg = c.ui_border },

		-- --- SEMANTICS: THE HIERARCHY ---

		-- LEVEL 1: BACKGROUND NOISE (Structure)
		-- Nawiasy, przecinki, średniki - ciemne, prawie niewidoczne.
		Delimiter = { fg = c.blue_deep },
		Operator = { fg = c.blue_deep }, -- =, +, -
		Comment = { fg = c.fg_dim, italic = opts.italics.comments },

		-- LEVEL 2: THE FLOW (Keywords)
		-- Słowa kluczowe są częścią "wody". Nie krzyczą.
		Keyword = { fg = c.blue_haze, italic = opts.italics.keywords },
		Statement = { fg = c.blue_haze },
		Conditional = { fg = c.blue_haze },
		Repeat = { fg = c.blue_haze },

		-- LEVEL 3: THE OBJECTS (Variables)
		-- Czysta b       iel/piana.
		Identifier = { fg = c.fg_main },

		-- LEVEL 4: THE LIFE (Functions & Types)
		-- To co działa. Neon.
		Function = { fg = c.green_bio, bold = opts.bold.functions },
		Method = { fg = c.green_bio, bold = opts.bold.functions },
		Type = { fg = c.cyan_neon, bold = opts.bold.types },
		Structure = { fg = c.cyan_neon },

		-- LEVEL 5: THE TREASURE (Data)
		-- Najjaśniejszy punkt ekranu. Bursztyn.
		String = { fg = c.amber_bright, italic = opts.italics.strings },
		Number = { fg = c.amber_dark },
		Boolean = { fg = c.amber_dark, bold = true },
		Constant = { fg = c.amber_dark },

		-- --- SPECIALS & PLUGINS ---
		Special = { fg = c.cyan_neon },
		PreProc = { fg = c.blue_haze },

		-- HTML / JSX (Kluczowe dla Fullstacka)
		-- Tagi są strukturą (Woda), Atrybuty są właściwościami (Piana)
		["@tag"] = { fg = c.blue_haze },
		["@tag.attribute"] = { fg = c.fg_main, italic = true },
		["@tag.delimiter"] = { fg = c.blue_deep },

		-- JSON
		["@property.json"] = { fg = c.cyan_neon }, -- Klucze w JSON świecą

		-- TREESITTER REFINEMENTS
		["@variable.builtin"] = { fg = c.cyan_neon, italic = true }, -- this, self
		["@constructor"] = { fg = c.cyan_neon },
		["@keyword.return"] = { fg = c.error, bold = true }, -- Return musi być widoczny

		-- DIAGNOSTICS
		DiagnosticError = { fg = c.error },
		DiagnosticWarn = { fg = c.warning },
		DiagnosticInfo = { fg = c.info },
		DiagnosticHint = { fg = c.fg_dim },

		-- GIT
		GitSignsAdd = { fg = c.green_bio },
		GitSignsChange = { fg = c.warning },
		GitSignsDelete = { fg = c.error },
	}

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
