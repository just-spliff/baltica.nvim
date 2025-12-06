local M = {}

function M.setup(config)
	local c = require("baltica.palette").colors
	-- Zabezpieczenie: jeśli config.options jest puste, użyj domyślnych
	local opts = config.options or { transparent_background = false, italics = {}, bold = {} }

	-- GŁÓWNA LOGIKA TŁA
	-- Domyślnie bg_main (#01161B). Tylko jeśli explicit true -> NONE.
	local bg = c.bg_main
	if opts.transparent_background == true then
		bg = c.none
	end

	local bg_float = opts.transparent_background and c.none or c.bg_float

	local groups = {
		-- --- UI ---
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

		Pmenu = { fg = c.fg_dim, bg = c.bg_float },
		PmenuSel = { fg = c.bg_main, bg = c.green_bio, bold = true },
		PmenuSbar = { bg = c.bg_float },
		PmenuThumb = { bg = c.ui_border },

		-- --- HIERARCHIA KODU ---
		Comment = { fg = c.ui_line_nr, italic = opts.italics.comments },
		Delimiter = { fg = c.ui_line_nr },
		Operator = { fg = c.blue_deep },
		Punctuation = { fg = c.ui_line_nr },

		Keyword = { fg = c.blue_haze, italic = opts.italics.keywords },
		Statement = { fg = c.blue_haze },
		Conditional = { fg = c.blue_haze },
		Repeat = { fg = c.blue_haze },
		Include = { fg = c.blue_haze },
		Exception = { fg = c.error },

		Identifier = { fg = c.fg_main },

		Function = { fg = c.green_bio, bold = opts.bold.functions },
		Method = { fg = c.green_bio, bold = opts.bold.functions },
		Type = { fg = c.cyan_neon, bold = opts.bold.types },
		Structure = { fg = c.cyan_neon },
		Constructor = { fg = c.cyan_neon },

		String = { fg = c.amber_bright, italic = opts.italics.strings },
		Number = { fg = c.amber_dark },
		Boolean = { fg = c.amber_dark, bold = true },
		Constant = { fg = c.amber_dark },

		Special = { fg = c.cyan_neon },
		PreProc = { fg = c.blue_haze },

		-- TREESITTER
		["@punctuation.delimiter"] = { fg = c.ui_line_nr },
		["@punctuation.bracket"] = { fg = c.ui_line_nr },
		["@operator"] = { fg = c.blue_deep },
		["@variable"] = { fg = c.fg_main },
		["@variable.builtin"] = { fg = c.cyan_neon, italic = true },
		["@parameter"] = { fg = c.fg_main, italic = true },
		["@property"] = { fg = c.fg_main },
		["@tag"] = { fg = c.blue_haze },
		["@tag.attribute"] = { fg = c.fg_dim, italic = true },
		["@tag.delimiter"] = { fg = c.ui_line_nr },
		["@property.json"] = { fg = c.cyan_neon },
		["@keyword.return"] = { fg = c.error, bold = true },

		-- DIAGNOSTICS & GIT
		DiagnosticError = { fg = c.error },
		DiagnosticWarn = { fg = c.warning },
		DiagnosticInfo = { fg = c.info },
		DiagnosticHint = { fg = c.ui_line_nr },
		GitSignsAdd = { fg = c.green_bio },
		GitSignsChange = { fg = c.warning },
		GitSignsDelete = { fg = c.error },

		-- =========================================================
		-- BUFFERLINE FIX
		-- =========================================================
		-- Używamy tutaj c.bg_main (HEX) bezpośrednio jako fallback,
		-- jeśli zmienna 'bg' zawiodła. Ale używamy 'bg' jeśli działa.

		-- TŁO
		BufferLineFill = { fg = c.bg_main, bg = bg }, -- fg ustawione na tło by ukryć znaki
		BufferLineBackground = { fg = c.ui_line_nr, bg = bg },

		-- KARTA AKTYWNA
		BufferLineBufferSelected = { fg = c.fg_main, bg = bg, bold = true },
		BufferLineBufferVisible = { fg = c.fg_dim, bg = bg },

		-- SEPARATORY
		BufferLineSeparator = { fg = bg, bg = bg },
		BufferLineSeparatorSelected = { fg = bg, bg = bg },
		BufferLineSeparatorVisible = { fg = bg, bg = bg },

		-- WSKAŹNIK
		BufferLineIndicatorSelected = { fg = c.amber_bright, bg = bg },
		BufferLineIndicatorVisible = { fg = bg, bg = bg },

		-- POZOSTAŁE
		BufferLineCloseButton = { fg = c.ui_line_nr, bg = bg },
		BufferLineCloseButtonSelected = { fg = c.error, bg = bg },
		BufferLineModified = { fg = c.amber_dark, bg = bg },
		BufferLineModifiedSelected = { fg = c.amber_bright, bg = bg, bold = true },

		BufferLineError = { fg = c.error, bg = bg },
		BufferLineErrorDiagnostic = { fg = c.error, bg = bg },

		-- Tablice
		BufferLineTab = { fg = c.ui_line_nr, bg = bg },
		BufferLineTabSelected = { fg = c.fg_main, bg = bg },
		BufferLineTabSeparator = { fg = bg, bg = bg },
		BufferLineTabClose = { fg = c.error, bg = bg },
	}

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
