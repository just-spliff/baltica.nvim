local M = {}

function M.setup(config)
	local c = require("baltica.palette").colors
	local opts = config.options

	-- Obsługa przezroczystości
	local bg = opts.transparent_background and c.none or c.abyss
	local bg_ui = opts.transparent_background and c.none or c.abyss_layer

	local groups = {
		-- --- UI: ZANURZENIE ---
		Normal = { fg = c.foam_white, bg = bg }, -- Zwykły tekst to piana
		NormalFloat = { fg = c.foam_white, bg = bg_ui },
		FloatBorder = { fg = c.electric_cyan, bg = bg_ui }, -- Ramki świecą jak neon

		-- Interfejs w kolorach głębinowych
		CursorLine = { bg = c.abyss_layer },
		CursorLineNr = { fg = c.electric_cyan, bold = true },
		LineNr = { fg = c.sea_shadow },
		SignColumn = { bg = bg },
		VertSplit = { fg = c.abyss_highlight, bg = c.none },

		-- Selekcja to nie szare tło. To rozjaśniona woda.
		Visual = { bg = c.abyss_highlight },

		-- Wyszukiwanie to światło latarki w wodzie
		Search = { fg = c.abyss, bg = c.plankton_green },
		IncSearch = { fg = c.abyss, bg = c.electric_cyan },

		-- --- SEMANTYKA (THE LOGIC) ---

		-- KOMENTARZE: Ciche, w tle.
		Comment = { fg = c.sea_shadow, italic = opts.italics.comments },

		-- 1. STRUKTURA = WODA (Cyjany i Błękity)
		-- Wszystko co steruje kodem należy do żywiołu wody.
		Statement = { fg = c.electric_cyan, bold = true }, -- if, else, return, for
		Conditional = { fg = c.electric_cyan, bold = true },
		Repeat = { fg = c.electric_cyan, bold = true },
		Operator = { fg = c.electric_cyan }, -- =, +, -, =>
		Keyword = { fg = c.electric_cyan, italic = opts.italics.keywords },
		Type = { fg = c.deep_current, bold = true }, -- int, string, void
		Include = { fg = c.deep_current }, -- import, include
		Delimiter = { fg = c.sea_shadow }, -- (), {}, [] (mało widoczne, jak dno)

		-- 2. DANE = BURSZTYN (Ciepłe Złoto/Pomarańcz)
		-- Tylko dane mają ciepły kolor. To sprawia, że stringi "wyskakują" z ekranu.
		String = { fg = c.burning_amber, italic = opts.italics.strings },
		Character = { fg = c.burning_amber },
		Number = { fg = c.ancient_gold },
		Boolean = { fg = c.ancient_gold, bold = true },
		Constant = { fg = c.ancient_gold },

		-- 3. AKCJA = FOSFORESCENCJA (Neonowa Zieleń)
		-- To co "robi" rzeczy.
		Function = { fg = c.plankton_green, bold = opts.bold.functions },
		Identifier = { fg = c.foam_white }, -- Zmienne są neutralne (jak piana/woda)

		-- SPECJALNE
		PreProc = { fg = c.jellyfish_sting }, -- Dekoratory, makra
		Special = { fg = c.jellyfish_sting },

		-- --- TREESITTER (Dla precyzji) ---
		["@variable"] = { fg = c.foam_white }, -- Czystość czytania
		["@variable.builtin"] = { fg = c.electric_cyan, italic = true }, -- this, self
		["@property"] = { fg = c.foam_white }, -- object properties

		["@function"] = { fg = c.plankton_green, bold = opts.bold.functions },
		["@function.builtin"] = { fg = c.plankton_green },
		["@method"] = { fg = c.plankton_green },

		["@keyword"] = { fg = c.electric_cyan },
		["@operator"] = { fg = c.electric_cyan },

		["@string"] = { fg = c.burning_amber },
		["@number"] = { fg = c.ancient_gold },

		-- HTML/REACT TAGS:
		-- Tagi nie są czerwone. Są elementem struktury (Woda/Cyjan).
		["@tag"] = { fg = c.deep_current },
		["@tag.attribute"] = { fg = c.plankton_green }, -- atrybuty to akcja
		["@tag.delimiter"] = { fg = c.sea_shadow },

		-- DIAGNOSTYKA
		DiagnosticError = { fg = c.jellyfish_sting },
		DiagnosticWarn = { fg = c.rust_warning },
		DiagnosticInfo = { fg = c.electric_cyan },
	}

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
