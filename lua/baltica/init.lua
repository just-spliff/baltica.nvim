local M = {}

M.config = require("baltica.config")
M.palette = require("baltica.palette")
M.highlights = require("baltica.highlights")

function M.setup(opts)
	M.config.setup(opts)
end

function M.load()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "baltica"

	-- Pobieramy kolory i opcje
	local colors = M.palette.colors
	local config = M.config.options

	-- Generujemy highlighty
	local groups = M.highlights.setup(colors, config)

	-- Aplikujemy highlighty
	for group, settings in pairs(groups) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return M
