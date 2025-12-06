local M = {}
local config = require("baltica.config")
local highlights = require("baltica.highlights")
local palette = require("baltica.palette")

function M.setup(opts)
	config.setup(opts)
end

function M.load()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "baltica"

	-- 1. Ładujemy podstawowe highlighty
	highlights.setup(config)

	-- 2. Logika wymuszania (Override) dla Bufferline
	local c = palette.colors
	local is_transparent = config.options.transparent_background

	-- Tutaj dzieje się magia:
	-- Jeśli transparent = true -> bg_color to "NONE"
	-- Jeśli transparent = false -> bg_color to "#01161B"
	local bg_color = is_transparent and "NONE" or c.bg_main

	local overrides = {
		-- TŁO PASKA (FILL)
		-- Ustawiamy fg na to samo co bg, żeby ukryć ewentualne "kropki" separatorów
		BufferLineFill = { bg = bg_color, fg = bg_color },

		-- KARTA NIEAKTYWNA
		BufferLineBackground = { bg = bg_color, fg = c.ui_line_nr },

		-- KARTA AKTYWNA
		-- Tło musi być takie samo jak fill (bg_color), żeby było seamless
		BufferLineBufferSelected = { bg = bg_color, fg = c.fg_main, bold = true },
		BufferLineBufferVisible = { bg = bg_color, fg = c.fg_dim },

		-- SEPARATORY (Kluczowe dla transparentności)
		BufferLineSeparator = { bg = bg_color, fg = bg_color },
		BufferLineSeparatorSelected = { bg = bg_color, fg = bg_color },
		BufferLineSeparatorVisible = { bg = bg_color, fg = bg_color },

		-- WSKAŹNIKI I IKONY
		BufferLineIndicatorSelected = { bg = bg_color, fg = c.amber_bright },
		BufferLineIndicatorVisible = { bg = bg_color, fg = bg_color },

		BufferLineCloseButton = { bg = bg_color, fg = c.ui_line_nr },
		BufferLineCloseButtonSelected = { bg = bg_color, fg = c.error },

		BufferLineModified = { bg = bg_color, fg = c.amber_dark },
		BufferLineModifiedSelected = { bg = bg_color, fg = c.amber_bright, bold = true },

		-- DIAGNOSTYKA
		BufferLineError = { bg = bg_color, fg = c.error },
		BufferLineErrorSelected = { bg = bg_color, fg = c.error, bold = true, italic = true },

		BufferLineWarning = { bg = bg_color, fg = c.warning },
		BufferLineWarningSelected = { bg = bg_color, fg = c.warning, bold = true, italic = true },
	}

	-- Aplikujemy nadpisania
	for group, opts in pairs(overrides) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
