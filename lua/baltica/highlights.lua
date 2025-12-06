local M = {}

function M.setup(config)
	local c = require("baltica.palette").colors
	local opts = config.options

	local bg = opts.transparent_background and c.none or c.bg_main
	local bg_float = opts.transparent_background and c.none or c.bg_float

	local groups = {
		-- --- UI: DEEP IMMERSION ---
		Normal = { fg = c.fg_main, bg = bg },
		NormalNC = { fg = c.fg_main, bg = bg },
		NormalFloat = { fg = c.fg_main, bg = bg_float },
		FloatBorder = { fg = c.ui_border, bg = bg_float },

		-- Kursor i linia: Bardzo subtelne
		Cursor = { fg = c.bg_main, bg = c.ui_cursor },
		CursorLine = { bg = c.bg_float },
		CursorLineNr = { fg = c.cyan_neon, bold = true },
		LineNr = { fg = c.ui_line_nr }, -- Ciemny, zgaszony kolor

		SignColumn = { bg = bg },
		VertSplit = { fg = c.ui_border, bg = c.none },
		WinSeparator = { fg = c.ui_border, bg = c.none },

		-- Wyszukiwanie: Kontrastowe, ale eleganckie
		Visual = { bg = c.bg_visual },
		Search = { fg = c.bg_main, bg = c.amber_bright, bold = true },
		IncSearch = { fg = c.bg_main, bg = c.cyan_neon },

		Pmenu = { fg = c.fg_dim, bg = c.bg_float }, -- Menu nieaktywne jest przygaszone
		PmenuSel = { fg = c.bg_main, bg = c.green_bio, bold = true }, -- Aktywne świeci

		-- --- HIERARCHIA KODU (THE CLEANUP) ---

		-- 1. WARSTWA NIEWIDZIALNA (Noise Reduction)
		-- To jest ta zmiana, o którą prosiłeś.
		-- Operatory, kropki, średniki, nawiasy są w kolorze 'sonar_grey' lub 'blue_deep'.
		-- Są ciemniejsze niż główny tekst. Nie wybijają się.
		Comment = { fg = c.ui_line_nr, italic = opts.italics.comments }, -- Komentarze bardzo ciemne
		Delimiter = { fg = c.ui_line_nr }, -- () {} [] - ciemne, prawie jak tło
		Operator = { fg = c.blue_deep }, -- = + - * : ? - ciemny morski, nie świeci!
		Punctuation = { fg = c.ui_line_nr }, -- . , ;

		-- 2. WARSTWA WODY (Structure)
		-- Słowa kluczowe. Widoczne, ale chłodne i spokojne.
		Keyword = { fg = c.blue_haze, italic = opts.italics.keywords },
		Statement = { fg = c.blue_haze }, -- if, else
		Conditional = { fg = c.blue_haze },
		Repeat = { fg = c.blue_haze }, -- for, while
		Exception = { fg = c.error }, -- try, catch (wyjątek: błędy widać)
		Include = { fg = c.blue_haze }, -- import

		-- 3. WARSTWA PIANY (Content)
		-- Zmienne. Czysta, jasna biel.
		Identifier = { fg = c.fg_main },

		-- 4. WARSTWA ŻYCIA (Action)
		-- Funkcje. Neonowa zieleń. To one napędzają kod.
		Function = { fg = c.green_bio, bold = opts.bold.functions },
		Method = { fg = c.green_bio, bold = opts.bold.functions },

		-- 5. WARSTWA SKARBU (Data)
		-- Bursztyn. Najjaśniejszy punkt.
		String = { fg = c.amber_bright, italic = opts.italics.strings },
		Number = { fg = c.amber_dark },
		Boolean = { fg = c.amber_dark, bold = true },
		Constant = { fg = c.amber_dark },

		-- Typy i Klasy (Neonowy Cyjan - Technologia)
		Type = { fg = c.cyan_neon, bold = opts.bold.types },
		Structure = { fg = c.cyan_neon }, -- interface, struct
		Constructor = { fg = c.cyan_neon },

		-- --- TREESITTER (PRECYZJA) ---

		-- Wyciemnianie interpunkcji w Treesitterze (Kluczowe!)
		["@punctuation.delimiter"] = { fg = c.ui_line_nr }, -- , ; .
		["@punctuation.bracket"] = { fg = c.ui_line_nr }, -- () {} []
		["@operator"] = { fg = c.blue_deep }, -- === !== || &&

		-- Zmienne i Parametry
		["@variable"] = { fg = c.fg_main },
		["@variable.builtin"] = { fg = c.cyan_neon, italic = true }, -- this
		["@parameter"] = { fg = c.fg_main, italic = true }, -- parametry odróżniamy tylko kursywą
		["@property"] = { fg = c.fg_main }, -- w JS obj.prop - prop jest biały (czystość)

		-- HTML / JSX / TSX
		-- Tagi: Struktura (Woda), Atrybuty: Przygaszone, Znaki: Ciemne
		["@tag"] = { fg = c.blue_haze }, -- <div
		["@tag.attribute"] = { fg = c.fg_dim, italic = true }, -- className (szare, nieistotne)
		["@tag.delimiter"] = { fg = c.ui_line_nr }, -- > (ciemne!)

		-- JSON (Tu klucze są ważne, więc cyjan)
		["@property.json"] = { fg = c.cyan_neon },

		-- Markdown (Dokumentacja)
		["@text.literal"] = { fg = c.amber_bright }, -- code blocks
		["@text.strong"] = { bold = true },
		["@text.emphasis"] = { italic = true },

		-- DIAGNOSTICS & GIT
		DiagnosticError = { fg = c.error },
		DiagnosticWarn = { fg = c.warning },
		DiagnosticInfo = { fg = c.info },
		DiagnosticHint = { fg = c.ui_line_nr },

		GitSignsAdd = { fg = c.green_bio },
		GitSignsChange = { fg = c.warning },
		GitSignsDelete = { fg = c.error },

		BufferLineFill = { bg = bg },

		-- Nieaktywne zakładki (Zanurzone)
		BufferLineBackground = { fg = c.ui_line_nr, bg = bg },

		-- Aktywna zakładka (Wynurzona, jaśniejsza)
		BufferLineBufferSelected = { fg = c.fg_main, bg = bg_float, bold = true, italic = false },

		-- Separatory (Pionowe kreski)
		-- Ustawiamy tak, aby zlewały się z tłem, dając efekt "pływających" napisów
		BufferLineSeparator = { fg = bg, bg = bg },
		BufferLineSeparatorSelected = { fg = bg, bg = bg_float },

		-- Wskaźnik (Pasek na górze/dole aktywnej karty)
		BufferLineIndicatorSelected = { fg = c.cyan_neon, bg = bg_float },

		-- Plik zmodyfikowany (Niezapisany) - Bursztyn
		BufferLineModified = { fg = c.amber_dark, bg = bg },
		BufferLineModifiedSelected = { fg = c.amber_bright, bg = bg_float },

		-- Ikony błędów/diagnostyki w zakładkach
		BufferLineError = { fg = c.error, bg = bg },
		BufferLineErrorSelected = { fg = c.error, bg = bg_float },
		BufferLineWarning = { fg = c.warning, bg = bg },
		BufferLineWarningSelected = { fg = c.warning, bg = bg_float },

		-- --- PLUGIN: TELESCOPE (Przy okazji, bo też ważne) ---
		TelescopeNormal = { fg = c.fg_main, bg = bg_float },
		TelescopeBorder = { fg = c.ui_border, bg = bg_float },
		TelescopePromptNormal = { fg = c.fg_main, bg = bg_float },
		TelescopePromptBorder = { fg = c.cyan_neon, bg = bg_float }, -- Ramka wpisywania świeci
		TelescopePromptTitle = { fg = c.bg_main, bg = c.cyan_neon, bold = true },
		TelescopePreviewTitle = { fg = c.bg_main, bg = c.green_bio, bold = true },
		TelescopeSelection = { bg = c.bg_visual, bold = true },

		-- --- PLUGIN: NVIM-TREE (File Explorer) ---
		NvimTreeNormal = { fg = c.fg_main, bg = bg }, -- Tło jak w edytorze
		NvimTreeWinSeparator = { fg = c.ui_border, bg = c.none },
		NvimTreeFolderName = { fg = c.blue_haze, bold = true },
		NvimTreeOpenedFolderName = { fg = c.cyan_neon, bold = true },
		NvimTreeGitDirty = { fg = c.amber_bright },
		NvimTreeGitNew = { fg = c.green_bio },
		NvimTreeGitDeleted = { fg = c.error },
	}

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
