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

	highlights.setup(config)

	local c = palette.colors

	local is_transparent = config.options.transparent_background
	local bg_color = is_transparent and "NONE" or c.bg_main -- #01161B

	local overrides = {
		BufferLineFill = { bg = bg_color },

		BufferLineBackground = { bg = bg_color, fg = c.ui_line_nr },

		BufferLineSeparator = { bg = bg_color, fg = bg_color },
		BufferLineSeparatorSelected = { bg = bg_color, fg = bg_color },
		BufferLineSeparatorVisible = { bg = bg_color, fg = bg_color },

		BufferLineIndicatorVisible = { bg = bg_color, fg = bg_color },
	}

	for group, opts in pairs(overrides) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
