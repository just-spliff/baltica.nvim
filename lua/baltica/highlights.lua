local M = {}

function M.setup(c, config)
	local transparent = config.transparent_background
	local bg = transparent and c.none or c.bg_main
	local bg_float = transparent and c.none or c.bg_float

	-- Jeśli transparent, to Bufferline ma tło NONE. Jeśli nie, to Deep Petrol.
	local bg_bar = transparent and c.none or c.bg_main

	local groups = {
		-- UI BASE
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

		Pmenu = { fg = c.fg_dim, bg = c.bg_float },
		PmenuSel = { fg = c.bg_main, bg = c.green_bio, bold = true },

		-- SYNTAX
		Comment = { fg = c.ui_line_nr, italic = config.italics.comments },
		Delimiter = { fg = c.blue_deep },
		Operator = { fg = c.blue_deep },
		Keyword = { fg = c.blue_haze, italic = config.italics.keywords },
		Statement = { fg = c.blue_haze },
		Conditional = { fg = c.blue_haze },
		Function = { fg = c.green_bio, bold = config.bold.functions },
		Identifier = { fg = c.fg_main },
		String = { fg = c.amber_bright, italic = config.italics.strings },
		Number = { fg = c.amber_dark },
		Type = { fg = c.cyan_neon, bold = config.bold.types },
		Special = { fg = c.cyan_neon },

		-- TREESITTER
		["@variable"] = { fg = c.fg_main },
		["@punctuation.delimiter"] = { fg = c.ui_line_nr },
		["@punctuation.bracket"] = { fg = c.ui_line_nr },
		["@tag"] = { fg = c.blue_haze },
		["@tag.attribute"] = { fg = c.fg_dim, italic = true },
		["@tag.delimiter"] = { fg = c.ui_line_nr },

		BufferLineFill = { bg = bg_bar },
		BufferLineBackground = { fg = c.ui_line_nr, bg = bg_bar },

		BufferLineBufferSelected = { fg = c.fg_main, bg = bg_bar, bold = true },
		BufferLineBufferVisible = { fg = c.fg_dim, bg = bg_bar },

		BufferLineSeparator = { fg = bg_bar, bg = bg_bar },
		BufferLineSeparatorSelected = { fg = bg_bar, bg = bg_bar },
		BufferLineSeparatorVisible = { fg = bg_bar, bg = bg_bar },

		BufferLineIndicatorSelected = { fg = c.amber_bright, bg = bg_bar },
		BufferLineIndicatorVisible = { fg = bg_bar, bg = bg_bar },

		BufferLineCloseButton = { fg = c.ui_line_nr, bg = bg_bar },
		BufferLineCloseButtonSelected = { fg = c.error, bg = bg_bar },

		BufferLineModified = { fg = c.amber_dark, bg = bg_bar },
		BufferLineModifiedSelected = { fg = c.amber_bright, bg = bg_bar, bold = true },

		BufferLineError = { fg = c.error, bg = bg_bar },
		BufferLineErrorDiagnostic = { fg = c.error, bg = bg_bar },

		BufferLineOffsetSeparator = { fg = c.ui_border, bg = bg_bar },
	}

	return groups
end

return M
