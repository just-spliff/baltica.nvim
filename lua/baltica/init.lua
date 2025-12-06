local M = {}

-- Importujemy moduły
M.config = require("baltica.config")
M.palette = require("baltica.palette")
M.highlights = require("baltica.highlights")

function M.setup(opts)
	M.config.setup(opts)
end

function M.load()
	-- 1. Reset
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "baltica"

	-- 2. Pobieramy dane
	local colors = M.palette.colors
	local config = M.config.options

	-- 3. Generujemy tabelę grup (To zwraca highlights.lua)
	local groups = M.highlights.setup(colors, config)

	-- 4. APLIKUJEMY KOLORY (Tego brakowało!)
	for group, settings in pairs(groups) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return M
