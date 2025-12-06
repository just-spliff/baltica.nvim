local M = {}

function M.setup(config)
	local c = require("baltica.palette").colors
	local opts = config.options

	-- Logika dla edytora (zostawiamy zmienną, bo działa dla reszty)
	local bg = opts.transparent_background and c.none or c.bg_main
	local bg_float = opts.transparent_background and c.none or c.bg_float

	-- DEFINE HARDCODED BACKGROUND FOR BUFFERLINE
	-- To jest ten kolor Deep Petrol. Wpisany na sztywno.
	local hard_bg = "#01161B"

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
		-- BUFFERLINE: HARDCODED FIX (#01161B)
		-- =========================================================
		-- Używamy zmiennej 'hard_bg', która zawiera surowy HEX.

		-- 1. FILL (Tło paska)
		BufferLineFill = { bg = hard_bg },

		-- 2. KARTA NIEAKTYWNA
		BufferLineBackground = { fg = c.ui_line_nr, bg = hard_bg },

		-- 3. KARTA AKTYWNA
		BufferLineBufferSelected = { fg = c.fg_main, bg = hard_bg, bold = true },
		BufferLineBufferVisible = { fg = c.fg_dim, bg = hard_bg },

		-- 4. SEPARATORY
		BufferLineSeparator = { fg = hard_bg, bg = hard_bg },
		BufferLineSeparatorSelected = { fg = hard_bg, bg = hard_bg },
		BufferLineSeparatorVisible = { fg = hard_bg, bg = hard_bg },

		-- 5. WSKAŹNIK
		BufferLineIndicatorSelected = { fg = c.amber_bright, bg = hard_bg },
		BufferLineIndicatorVisible = { fg = hard_bg, bg = hard_bg },

		-- 6. CLOSE ICONS
		BufferLineCloseButton = { fg = c.ui_line_nr, bg = hard_bg },
		BufferLineCloseButtonSelected = { fg = c.error, bg = hard_bg },
		BufferLineCloseButtonVisible = { fg = c.ui_line_nr, bg = hard_bg },

		-- 7. MODIFIED
		BufferLineModified = { fg = c.amber_dark, bg = hard_bg },
		BufferLineModifiedSelected = { fg = c.amber_bright, bg = hard_bg, bold = true },
		BufferLineModifiedVisible = { fg = c.amber_dark, bg = hard_bg },

		-- 8. DIAGNOSTICS
		BufferLineError = { fg = c.error, bg = hard_bg },
		BufferLineErrorDiagnostic = { fg = c.error, bg = hard_bg },
		BufferLineWarning = { fg = c.warning, bg = hard_bg },
		BufferLineWarningDiagnostic = { fg = c.warning, bg = hard_bg },

		-- 9. PICK & OFFSET
		BufferLinePick = { fg = c.error, bg = hard_bg, bold = true },
		BufferLineOffsetSeparator = { fg = c.ui_border, bg = hard_bg },
	}

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
