local M = {}

function M.setup(c, opts)
	-- 1. Logika tła (Tokyonight Style)
	local transparent = opts.transparent_background
	local bg = transparent and c.none or c.bg_main
	local bg_float = transparent and c.none or c.bg_float

	-- Dla bufferline: jeśli transparent to "NONE", jeśli nie to bg_main
	local bg_bar = transparent and c.none or c.bg_main

	local theme = {}

	-- Funkcja pomocnicza do dodawania grup
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
	hl("VertSplit", { fg = c.ui_border, bg = c.none })
	hl("WinSeparator", { fg = c.ui_border, bg = c.none })

	hl("Visual", { bg = c.bg_visual or "#10333B" })
	hl("Search", { fg = c.bg_main, bg = c.amber_bright, bold = true })

	hl("Pmenu", { fg = c.fg_dim, bg = c.bg_float })
	hl("PmenuSel", { fg = c.bg_main, bg = c.green_bio, bold = true })
	hl("PmenuSbar", { bg = c.bg_float })
	hl("PmenuThumb", { bg = c.ui_border })

	-- --- SYNTAX ---
	hl("Comment", { fg = c.ui_line_nr, italic = opts.italics.comments })
	hl("Delimiter", { fg = c.blue_deep })
	hl("Operator", { fg = c.blue_deep })
	hl("Keyword", { fg = c.blue_haze, italic = opts.italics.keywords })
	hl("Statement", { fg = c.blue_haze })
	hl("Conditional", { fg = c.blue_haze })
	hl("Repeat", { fg = c.blue_haze })
	hl("Include", { fg = c.blue_haze })
	hl("Function", { fg = c.green_bio, bold = opts.bold.functions })
	hl("Identifier", { fg = c.fg_main })
	hl("String", { fg = c.amber_bright, italic = opts.italics.strings })
	hl("Number", { fg = c.amber_dark })
	hl("Boolean", { fg = c.amber_dark, bold = true })
	hl("Type", { fg = c.cyan_neon, bold = opts.bold.types })

	-- --- TREESITTER ---
	hl("@variable", { fg = c.fg_main })
	hl("@function", { fg = c.green_bio, bold = opts.bold.functions })
	hl("@keyword.return", { fg = c.error, bold = true })
	hl("@tag", { fg = c.blue_haze })
	hl("@tag.attribute", { fg = c.fg_dim, italic = true })
	hl("@tag.delimiter", { fg = c.ui_line_nr })
	hl("@punctuation.delimiter", { fg = c.ui_line_nr })
	hl("@punctuation.bracket", { fg = c.ui_line_nr })

	-- --- DIAGNOSTICS ---
	hl("DiagnosticError", { fg = c.error })
	hl("DiagnosticWarn", { fg = c.warning })
	hl("DiagnosticInfo", { fg = c.info })
	hl("DiagnosticHint", { fg = c.ui_line_nr })

	hl("GitSignsAdd", { fg = c.green_bio })
	hl("GitSignsChange", { fg = c.warning })
	hl("GitSignsDelete", { fg = c.error })

	-- =================================================================
	-- BUFFERLINE INTEGRATION (Tokyonight Style)
	-- =================================================================
	-- Klucz: Używamy bg_bar, które jest albo NONE albo kolorem tła.

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
