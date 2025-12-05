local M = {}

function M.setup(config)
	local c = require("baltica.palette").colors
	local opts = config.options

	local bg = opts.transparent_background and c.none or c.void_main
	local bg_float = opts.transparent_background and c.none or c.void_float

	local groups = {
		-- --- ATMOSPHERE (UI) ---
		Normal = { fg = c.ghost_white, bg = bg },
		NormalFloat = { fg = c.ghost_white, bg = bg_float },
		FloatBorder = { fg = c.glass_frame, bg = bg_float },

		-- Interfejs ma być subtelny, techniczny
		Cursor = { fg = c.void_main, bg = c.bio_venom }, -- Kursor to sonar
		CursorLine = { bg = c.void_float },
		CursorLineNr = { fg = c.bio_venom, bold = true },
		LineNr = { fg = c.sonar_grey },
		SignColumn = { bg = bg },
		VertSplit = { fg = c.void_darker, bg = c.void_darker }, -- Ciemna szczelina zamiast kreski

		Visual = { bg = c.selection_glaze }, -- Zanurzenie w głębszej wodzie
		Search = { fg = c.void_main, bg = c.amber_core }, -- Znalezienie bursztynu

		Pmenu = { fg = c.ghost_white, bg = c.void_float },
		PmenuSel = { fg = c.void_main, bg = c.bio_venom, bold = true },

		-- --- THE STORY (Syntax) ---

		-- 1. TŁO OPOWIEŚCI (Struktura, Komentarze, Słowa Kluczowe)
		-- To wszystko jest zimne, wycofane. Buduje klimat, ale nie krzyczy.
		Comment = { fg = c.ghost_dim, italic = true },
		Delimiter = { fg = c.sonar_grey }, -- Nawiasy prawie znikają
		Operator = { fg = c.ice_blue }, -- =, +, -

		-- UWAGA: Słowa kluczowe są ZIMNE. To największa zmiana.
		-- Zamiast czerwonego `if`, masz lodowaty błękit.
		Keyword = { fg = c.ice_blue, italic = opts.italics.keywords },
		Statement = { fg = c.ice_blue },
		Conditional = { fg = c.ice_blue },
		Repeat = { fg = c.ice_blue },
		Include = { fg = c.ice_blue },

		-- 2. ŻYCIE (Funkcje, Klasy, Typy)
		-- To co "działa". Neonowa zieleń i cyjan.
		Function = { fg = c.bio_venom, bold = true, shadow = true }, -- GLOW EFFECT (symulowany boldem)
		Method = { fg = c.bio_venom, bold = true },
		Type = { fg = c.bio_electric }, -- Klasy, Interface'y
		Structure = { fg = c.bio_electric },
		Constructor = { fg = c.bio_electric },

		-- 3. SKARB (Dane)
		-- Bursztyn. To ma przyciągać wzrok.
		String = { fg = c.amber_core, italic = opts.italics.strings },
		Character = { fg = c.amber_core },
		Number = { fg = c.amber_glass },
		Boolean = { fg = c.amber_core, bold = true },
		Constant = { fg = c.amber_core },

		-- ZMIENNE (Neutralne)
		Identifier = { fg = c.ghost_white }, -- Zmienne są po prostu duchem

		-- SPECJALNE
		Special = { fg = c.bio_electric },
		PreProc = { fg = c.glass_frame }, -- Preprocesory ciemne, techniczne

		-- --- TREESITTER REFINEMENTS ---
		["@variable"] = { fg = c.ghost_white },
		["@variable.builtin"] = { fg = c.ice_blue }, -- this, self
		["@variable.parameter"] = { fg = c.amber_glass }, -- parametry w funkcji są lekko bursztynowe

		["@function"] = { fg = c.bio_venom, bold = true },
		["@function.builtin"] = { fg = c.bio_electric },

		["@keyword"] = { fg = c.ice_blue },
		["@keyword.function"] = { fg = c.ice_blue }, -- `function` keyword
		["@keyword.return"] = { fg = c.rust_blood, bold = true }, -- WYJĄTEK: Return jest ważny, więc czerwony

		["@type.builtin"] = { fg = c.bio_electric },

		-- TAGI (HTML/JSX) - Struktura szklana, atrybuty zimne
		["@tag"] = { fg = c.ice_blue },
		["@tag.attribute"] = { fg = c.ghost_dim }, -- Atrybuty wycofane
		["@tag.delimiter"] = { fg = c.sonar_grey },

		-- DIAGNOSTYKA
		DiagnosticError = { fg = c.rust_blood },
		DiagnosticWarn = { fg = c.warning_beam },
		DiagnosticInfo = { fg = c.bio_electric },
		DiagnosticHint = { fg = c.ghost_dim },

		-- GIT (Minimalistyczny)
		GitSignsAdd = { fg = c.bio_venom },
		GitSignsChange = { fg = c.amber_glass },
		GitSignsDelete = { fg = c.rust_blood },
	}

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
