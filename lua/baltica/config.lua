local M = {}

M.defaults = {
	-- Czy tło ma być przezroczyste?
	transparent_background = false,

	-- Style czcionek
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
}

M.options = {}

function M.setup(user_opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, user_opts or {})
end

return M
