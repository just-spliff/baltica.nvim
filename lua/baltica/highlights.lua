local M = {}

function M.setup(c, config)
	-- LOGIKA TŁA
	local transparent = config.transparent_background

	-- Jeśli transparent=true, tło to string "NONE".
	-- Jeśli false, tło to Deep Petrol (#01161B).
	local bg = transparent and "NONE" or c.bg_main
	local bg_float = transparent and "NONE" or c.bg_float
	local bg_bar = transparent and "NONE" or c.bg_main

	local theme = {}
	local function hl(group, styles)
		theme[group] = styles
	end

	-- --- UI BASE ---
	hl("Normal", { fg = c.fg_main, bg = bg })
	hl("NormalNC", { fg = c.fg_main, bg = bg })
	hl("NormalFloat", { fg = c.fg_main, bg = bg_float })
	hl("FloatBorder", { fg = c.ui_border, bg = bg_float })

	hl("Cursor", { fg = c.bg_main, bg = c.ui_cursor })
	hl("CursorLine", { bg = c.bg_float })
	hl("CursorLineNr", { fg = c.cyan_neon, bold = true })
	hl("LineNr", { fg = c.ui_line_nr })

	hl("SignColumn", { bg = bg })
	hl("VertSplit", { fg = c.ui_border, bg = "NONE" })
	hl("WinSeparator", { fg = c.ui_border, bg = "NONE" })

	hl("Visual", { bg = c.bg_visual })
	hl("Search", { fg = c.bg_main, bg = c.amber_bright, bold = true })

	hl("Pmenu", { fg = c.fg_dim, bg = c.bg_float })
	hl("PmenuSel", { fg = c.bg_main, bg = c.green_bio, bold = true })
	hl("PmenuSbar", { bg = c.bg_float })
	hl("PmenuThumb", { bg = c.ui_border })

	-- --- SYNTAX ---
	hl("Comment", { fg = c.ui_line_nr, italic = config.italics.comments })
	hl("Delimiter", { fg = c.blue_deep })
	hl("Operator", { fg = c.blue_deep })
	hl("Keyword", { fg = c.blue_haze, italic = config.italics.keywords })
	hl("Statement", { fg = c.blue_haze })
	hl("Conditional", { fg = c.blue_haze })
	hl("Function", { fg = c.green_bio, bold = config.bold.functions })
	hl("Identifier", { fg = c.fg_main })
	hl("String", { fg = c.amber_bright, italic = config.italics.strings })
	hl("Number", { fg = c.amber_dark })
	hl("Type", { fg = c.cyan_neon, bold = config.bold.types })
	hl("Special", { fg = c.cyan_neon })

	-- --- TREESITTER ---
	hl("@variable", { fg = c.fg_main })
	hl("@tag", { fg = c.blue_haze })
	hl("@tag.attribute", { fg = c.fg_dim, italic = true })
	hl("@tag.delimiter", { fg = c.ui_line_nr })
	hl("@punctuation.delimiter", { fg = c.ui_line_nr })
	hl("@punctuation.bracket", { fg = c.ui_line_nr })

	-- --- BUFFERLINE (Tokyonight Style) ---
	-- Używamy bg_bar ("NONE" lub "#01161B") wszędzie
	hl("BufferLineFill", { bg = bg_bar })
	hl("BufferLineBackground", { fg = c.ui_line_nr, bg = bg_bar })

	hl("BufferLineBufferSelected", { fg = c.fg_main, bg = bg_bar, bold = true })
	hl("BufferLineBufferVisible", { fg = c.fg_dim, bg = bg_bar })

	hl("BufferLineSeparator", { fg = bg_bar, bg = bg_bar })
	hl("BufferLineSeparatorSelected", { fg = bg_bar, bg = bg_bar })
	hl("BufferLineSeparatorVisible", { fg = bg_bar, bg = bg_bar })

	hl("BufferLineIndicatorSelected", { fg = c.amber_bright, bg = bg_bar })
	hl("BufferLineIndicatorVisible", { fg = bg_bar, bg = bg_bar })

	hl("BufferLineCloseButton", { fg = c.ui_line_nr, bg = bg_bar })
	hl("BufferLineCloseButtonSelected", { fg = c.error, bg = bg_bar })

	hl("BufferLineModified", { fg = c.amber_dark, bg = bg_bar })
	hl("BufferLineModifiedSelected", { fg = c.amber_bright, bg = bg_bar, bold = true })

	hl("BufferLineError", { fg = c.error, bg = bg_bar })
	hl("BufferLineErrorDiagnostic", { fg = c.error, bg = bg_bar })
	hl("BufferLineWarning", { fg = c.warning, bg = bg_bar })
	hl("BufferLineWarningDiagnostic", { fg = c.warning, bg = bg_bar })

	hl("BufferLineOffsetSeparator", { fg = c.ui_border, bg = bg_bar })

	return theme
end

return M
