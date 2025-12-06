local M = {}

function M.setup(config)
	local c = require("baltica.palette").colors
	local opts = config.options

	-- 1. Ustalanie tła (Logic from Tokyonight)
	local transparent = opts.transparent_background
	local bg = transparent and c.none or c.bg_main
	local bg_float = transparent and c.none or c.bg_float

	-- Tokyonight często używa ciemniejszego tła dla paneli bocznych, my użyjemy głównego
	local bg_sidebar = transparent and c.none or c.bg_main

	local highlights = {}

	-- 2. Funkcja pomocnicza do łączenia grup
	local function merge(t)
		for k, v in pairs(t) do
			highlights[k] = v
		end
	end

	-- ========================================================================
	-- BASE GROUPS (Podstawa edytora)
	-- ========================================================================
	merge({
		Normal = { fg = c.fg_main, bg = bg },
		NormalNC = { fg = c.fg_main, bg = bg },
		NormalFloat = { fg = c.fg_main, bg = bg_float },
		FloatBorder = { fg = c.ui_border, bg = bg_float },

		-- UI
		Cursor = { fg = c.bg_main, bg = c.ui_cursor },
		CursorLine = { bg = c.bg_float },
		CursorLineNr = { fg = c.cyan_neon, bold = true },
		LineNr = { fg = c.ui_line_nr },

		-- Gutter / Sidebar
		SignColumn = { bg = bg_sidebar },
		VertSplit = { fg = c.ui_border, bg = c.none },
		WinSeparator = { fg = c.ui_border, bg = c.none },

		-- Search / Visual
		Visual = { bg = c.bg_visual },
		Search = { fg = c.bg_main, bg = c.amber_bright, bold = true },
		IncSearch = { fg = c.bg_main, bg = c.cyan_neon },

		-- Popup Menu
		Pmenu = { fg = c.fg_dim, bg = c.bg_float },
		PmenuSel = { fg = c.bg_main, bg = c.green_bio, bold = true },
		PmenuSbar = { bg = c.bg_float },
		PmenuThumb = { bg = c.ui_border },

		-- Syntax (The Deep Dive Logic)
		Comment = { fg = c.ui_line_nr, italic = opts.italics.comments },
		Delimiter = { fg = c.blue_deep },
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
		Type = { fg = c.cyan_neon, bold = opts.bold.types },

		String = { fg = c.amber_bright, italic = opts.italics.strings },
		Number = { fg = c.amber_dark },
		Boolean = { fg = c.amber_dark, bold = true },
		Constant = { fg = c.amber_dark },

		Special = { fg = c.cyan_neon },
		PreProc = { fg = c.blue_haze },

		-- Diagnostics
		DiagnosticError = { fg = c.error },
		DiagnosticWarn = { fg = c.warning },
		DiagnosticInfo = { fg = c.info },
		DiagnosticHint = { fg = c.ui_line_nr },

		-- GitSigns
		GitSignsAdd = { fg = c.green_bio },
		GitSignsChange = { fg = c.warning },
		GitSignsDelete = { fg = c.error },
	})

	-- ========================================================================
	-- PLUGIN: BUFFERLINE (Tokyonight Style Integration)
	-- ========================================================================
	-- Kluczowe: Tokyonight używa tutaj zmiennej 'bg' (która jest już obliczona wyżej).
	-- Jeśli transparent=true, to bg=NONE. Jeśli false, to bg=#01161B.

	merge({
		-- Puste tło paska (Fill)
		BufferLineFill = { bg = bg },

		-- Karta Nieaktywna (Background)
		-- Tokyonight często ustawia to na 'bg_dark', my używamy 'bg' dla efektu flat.
		BufferLineBackground = { fg = c.ui_line_nr, bg = bg },

		-- Karta Aktywna (Selected)
		BufferLineBufferSelected = { fg = c.fg_main, bg = bg, bold = true },
		BufferLineBufferVisible = { fg = c.fg_dim, bg = bg },

		-- Separatory (Klucz do sukcesu)
		-- Muszą mieć identyczne tło jak Fill i BufferBackground
		BufferLineSeparator = { fg = bg, bg = bg },
		BufferLineSeparatorSelected = { fg = bg, bg = bg },
		BufferLineSeparatorVisible = { fg = bg, bg = bg },

		-- Wskaźnik (Indicator)
		BufferLineIndicatorSelected = { fg = c.amber_bright, bg = bg },
		BufferLineIndicatorVisible = { fg = bg, bg = bg },

		-- Elementy interfejsu
		BufferLineCloseButton = { fg = c.ui_line_nr, bg = bg },
		BufferLineCloseButtonSelected = { fg = c.error, bg = bg },
		BufferLineCloseButtonVisible = { fg = c.ui_line_nr, bg = bg },

		BufferLineModified = { fg = c.amber_dark, bg = bg },
		BufferLineModifiedSelected = { fg = c.amber_bright, bg = bg, bold = true },
		BufferLineModifiedVisible = { fg = c.amber_dark, bg = bg },

		-- Diagnostyka
		BufferLineError = { fg = c.error, bg = bg },
		BufferLineErrorSelected = { fg = c.error, bg = bg, bold = true, italic = true },
		BufferLineErrorDiagnostic = { fg = c.error, bg = bg },

		BufferLineWarning = { fg = c.warning, bg = bg },
		BufferLineWarningSelected = { fg = c.warning, bg = bg, bold = true, italic = true },
		BufferLineWarningDiagnostic = { fg = c.warning, bg = bg },

		BufferLineInfo = { fg = c.info, bg = bg },
		BufferLineInfoSelected = { fg = c.info, bg = bg, bold = true, italic = true },
		BufferLineInfoDiagnostic = { fg = c.info, bg = bg },

		BufferLineHint = { fg = c.ui_line_nr, bg = bg },
		BufferLineHintSelected = { fg = c.ui_line_nr, bg = bg, bold = true, italic = true },
		BufferLineHintDiagnostic = { fg = c.ui_line_nr, bg = bg },

		-- Picker / Offset
		BufferLinePick = { fg = c.error, bg = bg, bold = true },
		BufferLinePickSelected = { fg = c.error, bg = bg, bold = true },
		BufferLineOffsetSeparator = { fg = c.ui_border, bg = bg },

		-- TABS (Jeśli używasz kart vima zamiast buforów)
		BufferLineTab = { fg = c.ui_line_nr, bg = bg },
		BufferLineTabSelected = { fg = c.fg_main, bg = bg },
		BufferLineTabClose = { fg = c.error, bg = bg },
		BufferLineTabSeparator = { fg = bg, bg = bg },
	})

	-- ========================================================================
	-- TREESITTER (Standard)
	-- ========================================================================
	merge({
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
	})

	-- 3. APPLY HIGHLIGHTS
	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return M
