local M = {}

function M.setup(config)
	local c = require("baltica.palette").colors
	local opts = config.options
	local transparent = opts.transparent_background

	-- 1. DEFINICJA TŁA (Sztywna logika)
	local bg_editor, bg_float, fill_color

	if transparent then
		bg_editor = "NONE"
		bg_float = "NONE"
		fill_color = "NONE" -- To gwarantuje przezroczystość paska
	else
		bg_editor = c.bg_main
		bg_float = c.bg_float
		fill_color = c.bg_main -- To gwarantuje Deep Petrol
	end

	local groups = {
		-- UI
		Normal = { fg = c.fg_main, bg = bg_editor },
		NormalNC = { fg = c.fg_main, bg = bg_editor },
		NormalFloat = { fg = c.fg_main, bg = bg_float },
		FloatBorder = { fg = c.ui_border, bg = bg_float },

		Cursor = { fg = c.bg_main, bg = c.ui_cursor },
		CursorLine = { bg = c.bg_float },
		CursorLineNr = { fg = c.cyan_neon, bold = true },
		LineNr = { fg = c.ui_line_nr },
		SignColumn = { bg = bg_editor },

		-- Separatory okien (ważne przy przezroczystości)
		VertSplit = { fg = c.ui_border, bg = "NONE" },
		WinSeparator = { fg = c.ui_border, bg = "NONE" },

		Visual = { bg = c.bg_visual or "#10333B" },
		Search = { fg = c.bg_main, bg = c.amber_bright, bold = true },

		Pmenu = { fg = c.fg_dim, bg = c.bg_float },
		PmenuSel = { fg = c.bg_main, bg = c.green_bio, bold = true },

		-- SYNTAX
		Comment = { fg = c.ui_line_nr, italic = opts.italics.comments },
		Delimiter = { fg = c.blue_deep },
		Operator = { fg = c.blue_deep },

		Keyword = { fg = c.blue_haze, italic = opts.italics.keywords },
		Statement = { fg = c.blue_haze },
		Conditional = { fg = c.blue_haze },
		Repeat = { fg = c.blue_haze },
		Include = { fg = c.blue_haze },

		Identifier = { fg = c.fg_main },
		Function = { fg = c.green_bio, bold = opts.bold.functions },
		Type = { fg = c.cyan_neon, bold = opts.bold.types },

		String = { fg = c.amber_bright, italic = opts.italics.strings },
		Number = { fg = c.amber_dark },
		Boolean = { fg = c.amber_dark, bold = true },
		Constant = { fg = c.amber_dark },

		Special = { fg = c.cyan_neon },
		PreProc = { fg = c.blue_haze },

		-- TREESITTER
		["@variable"] = { fg = c.fg_main },
		["@punctuation.delimiter"] = { fg = c.ui_line_nr },
		["@punctuation.bracket"] = { fg = c.ui_line_nr },
		["@tag"] = { fg = c.blue_haze },
		["@tag.attribute"] = { fg = c.fg_dim, italic = true },
		["@tag.delimiter"] = { fg = c.ui_line_nr },

		-- =========================================================
		-- BUFFERLINE FIX
		-- =========================================================

		-- TŁO PASKA (FILL)
		-- Jeśli fill_color="NONE", pasek zniknie.
		BufferLineFill = { bg = fill_color },

		-- KARTA NIEAKTYWNA
		BufferLineBackground = { fg = c.ui_line_nr, bg = fill_color },

		-- KARTA AKTYWNA
		-- Tekst jasny, tło takie samo jak Fill (żeby było płasko/przezroczysto)
		BufferLineBufferSelected = { fg = c.fg_main, bg = fill_color, bold = true },
		BufferLineBufferVisible = { fg = c.fg_dim, bg = fill_color },

		-- SEPARATORY (Klucz do zniknięcia "kresek")
		BufferLineSeparator = { fg = fill_color, bg = fill_color },
		BufferLineSeparatorSelected = { fg = fill_color, bg = fill_color },
		BufferLineSeparatorVisible = { fg = fill_color, bg = fill_color },

		-- WSKAŹNIK (Tylko on ma kolor)
		BufferLineIndicatorSelected = { fg = c.amber_bright, bg = fill_color },
		BufferLineIndicatorVisible = { fg = fill_color, bg = fill_color },

		-- IKONY I PRZYCISKI
		BufferLineCloseButton = { fg = c.ui_line_nr, bg = fill_color },
		BufferLineCloseButtonSelected = { fg = c.error, bg = fill_color },
		BufferLineModified = { fg = c.amber_dark, bg = fill_color },
		BufferLineModifiedSelected = { fg = c.amber_bright, bg = fill_color, bold = true },

		-- DIAGNOSTYKA
		BufferLineError = { fg = c.error, bg = fill_color },
		BufferLineErrorDiagnostic = { fg = c.error, bg = fill_color },
		BufferLineWarning = { fg = c.warning, bg = fill_color },
		BufferLineWarningDiagnostic = { fg = c.warning, bg = fill_color },

		-- OFFSET
		BufferLineOffsetSeparator = { fg = c.ui_border, bg = fill_color },
	}

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
