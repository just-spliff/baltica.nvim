local M = {}

M.defaults = {
	-- Przełącznik przezroczystości
	transparent_background = false,

	-- Kontrola stylów tekstu
	italics = {
		comments = true,
		keywords = true,
		functions = false,
		strings = false,
		variables = false,
	},
	bold = {
		functions = true,
		keywords = false,
		types = true,
	},

	-- Opcjonalnie: integracje z pluginami (można rozszerzać w przyszłości)
	plugins = {
		gitsigns = true,
		treesitter = true,
		nvimtree = true,
	},
}

M.options = {}

function M.setup(user_opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, user_opts or {})
end

return M
