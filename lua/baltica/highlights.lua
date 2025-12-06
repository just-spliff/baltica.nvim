local M = {}

function M.setup(config)
	local c = require("baltica.palette").colors
	local opts = config.options

	-- 1. LOGIKA PRZEZROCZYSTOŚCI
	-- To jest kluczowe.
	-- bg_editor: To tło dla zwykłego kodu.
	-- bg_bufferline: To tło SPECIFICZNIE dla paska zakładek.

	local transparent = opts.transparent_background
	local bg_editor = transparent and c.none or c.bg_main
	local bg_float = transparent and c.none or c.bg_float

	-- Jeśli transparent=true, to bufferline ma być "NONE".
	-- Jeśli false, to ma być "Deep Petrol" (#01161B).
	local bg_bufferline = transparent and c.none or "#01161B"

	local groups = {
		-- --- UI ---
		Normal = { fg = c.fg_main, bg = bg_editor },
		NormalNC = { fg = c.fg_main, bg = bg_editor },
		NormalFloat = { fg = c.fg_main, bg = bg_float },
		FloatBorder = { fg = c.ui_border, bg = bg_float },

		Cursor = { fg = c.bg_main, bg = c.ui_cursor },
		CursorLine = { bg = c.bg_float },
		CursorLineNr = { fg = c.cyan_neon, bold = true },
		LineNr = { fg = c.ui_line_nr },

		SignColumn = { bg = bg_editor },
		VertSplit = { fg = c.ui_border, bg = c.none },
		WinSeparator = { fg = c.ui_border, bg = c.none },

		Visual = { bg = c.bg_visual },
		Search = { fg = c.bg_main, bg = c.amber_bright, bold = true },
		IncSearch = { fg = c.bg_main, bg = c.cyan_neon },

		Pmenu = { fg = c.fg_dim, bg = c.bg_float },
		PmenuSel = { fg = c.bg_main, bg = c.green_bio, bold = true },
		PmenuSbar = { bg = c.bg_float },
		PmenuThumb = { bg = c.ui_border },

		-- --- SYNTAX ---
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
		-- BUFFERLINE: TRANSPARENT & SEAMLESS FIX
		-- =========================================================
		-- Tutaj używamy zmiennej 'bg_bufferline'.
		-- Jeśli transparent=true, to jest "NONE".
		-- Jeśli transparent=false, to jest "#01161B".

		-- 1. FILL (Puste miejsce po prawej)
		BufferLineFill = { bg = bg_bufferline },

		-- 2. KARTA NIEAKTYWNA
		-- Tło ustawiamy na bg_bufferline.
		-- Tekst przygaszony.
		BufferLineBackground = { fg = c.ui_line_nr, bg = bg_bufferline },

		-- 3. KARTA AKTYWNA
		-- Tło również bg_bufferline (dzięki temu jest przezroczyste/płaskie).
		-- Wyróżniamy tylko jasnym tekstem i boldem.
		BufferLineBufferSelected = { fg = c.fg_main, bg = bg_bufferline, bold = true },
		BufferLineBufferVisible = { fg = c.fg_dim, bg = bg_bufferline },

		-- 4. SEPARATORY
		-- Ustawiamy FG i BG na bg_bufferline.
		-- W trybie transparent: są niewidoczne (NONE).
		-- W trybie solid: są niewidoczne (zlewają się z tłem).
		BufferLineSeparator = { fg = bg_bufferline, bg = bg_bufferline },
		BufferLineSeparatorSelected = { fg = bg_bufferline, bg = bg_bufferline },
		BufferLineSeparatorVisible = { fg = bg_bufferline, bg = bg_bufferline },

		-- 5. WSKAŹNIK (Bursztynowa kreska)
		BufferLineIndicatorSelected = { fg = c.amber_bright, bg = bg_bufferline },
		BufferLineIndicatorVisible = { fg = bg_bufferline, bg = bg_bufferline },

		-- 6. IKONY
		BufferLineCloseButton = { fg = c.ui_line_nr, bg = bg_bufferline },
		BufferLineCloseButtonSelected = { fg = c.error, bg = bg_bufferline },
		BufferLineCloseButtonVisible = { fg = c.ui_line_nr, bg = bg_bufferline },

		BufferLineModified = { fg = c.amber_dark, bg = bg_bufferline },
		BufferLineModifiedSelected = { fg = c.amber_bright, bg = bg_bufferline, bold = true },
		BufferLineModifiedVisible = { fg = c.amber_dark, bg = bg_bufferline },

		-- 7. DIAGNOSTYKA
		BufferLineError = { fg = c.error, bg = bg_bufferline },
		BufferLineErrorDiagnostic = { fg = c.error, bg = bg_bufferline },
		BufferLineWarning = { fg = c.warning, bg = bg_bufferline },
		BufferLineWarningDiagnostic = { fg = c.warning, bg = bg_bufferline },

		-- 8. OFFSET (NvimTree)
		BufferLineOffsetSeparator = { fg = c.ui_border, bg = bg_bufferline },
	}

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
