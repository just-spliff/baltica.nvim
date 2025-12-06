local M = {}
local config = require("baltica.config")
local highlights = require("baltica.highlights")

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
end

return M
