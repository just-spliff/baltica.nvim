local M = {}

function M.get(c, bg)
	-- bg to kolor tła (c.bg_main lub NONE jeśli transparent)
	-- c to paleta kolorów

	return {
		-- GLOWNE ELEMENTY (Tło musi być płaskie)
		BufferLineFill = { bg = bg },
		BufferLineBackground = { fg = c.sonar_grey, bg = bg }, -- Nieaktywne

		-- KARTA AKTYWNA
		BufferLineBufferSelected = { fg = c.fg_main, bg = bg, bold = true },
		BufferLineBufferVisible = { fg = c.fg_dim, bg = bg },

		-- SEPARATORY (Muszą zniknąć, by było płasko)
		BufferLineSeparator = { fg = bg, bg = bg },
		BufferLineSeparatorSelected = { fg = bg, bg = bg },
		BufferLineSeparatorVisible = { fg = bg, bg = bg },

		-- WSKAŹNIK (Bursztyn)
		BufferLineIndicatorSelected = { fg = c.amber_bright, bg = bg },
		BufferLineIndicatorVisible = { fg = bg, bg = bg },

		-- IKONY I PRZYCISKI
		BufferLineCloseButton = { fg = c.sonar_grey, bg = bg },
		BufferLineCloseButtonSelected = { fg = c.error, bg = bg },
		BufferLineCloseButtonVisible = { fg = c.sonar_grey, bg = bg },

		BufferLineModified = { fg = c.amber_dark, bg = bg },
		BufferLineModifiedSelected = { fg = c.amber_bright, bg = bg },
		BufferLineModifiedVisible = { fg = c.amber_dark, bg = bg },

		-- DIAGNOSTYKA (Error/Warn/Info/Hint)
		-- Ważne: Wszystkie tła ustawione na 'bg'
		BufferLineError = { fg = c.error, bg = bg },
		BufferLineErrorDiagnostic = { fg = c.error, bg = bg },
		BufferLineErrorSelected = { fg = c.error, bg = bg, bold = true, italic = true },

		BufferLineWarning = { fg = c.warning, bg = bg },
		BufferLineWarningDiagnostic = { fg = c.warning, bg = bg },
		BufferLineWarningSelected = { fg = c.warning, bg = bg, bold = true, italic = true },

		BufferLineInfo = { fg = c.info, bg = bg },
		BufferLineInfoDiagnostic = { fg = c.info, bg = bg },
		BufferLineInfoSelected = { fg = c.info, bg = bg, bold = true, italic = true },

		BufferLineHint = { fg = c.fg_dim, bg = bg },
		BufferLineHintDiagnostic = { fg = c.fg_dim, bg = bg },
		BufferLineHintSelected = { fg = c.fg_dim, bg = bg, bold = true, italic = true },

		-- NUMERY I PICKER
		BufferLineNumbers = { fg = c.sonar_grey, bg = bg },
		BufferLineNumbersSelected = { fg = c.cyan_neon, bg = bg, bold = true },
		BufferLinePick = { fg = c.error, bg = bg, bold = true },
		BufferLinePickSelected = { fg = c.error, bg = bg, bold = true },

		-- OFFSET (Dla NvimTree)
		BufferLineOffsetSeparator = { fg = c.ui_border, bg = bg },
	}
end

return M
