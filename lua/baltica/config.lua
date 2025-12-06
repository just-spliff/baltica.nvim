local M = {}

M.defaults = {
	transparent_background = false, -- Domyślnie wyłączone
	italics = {
		comments = true,
		keywords = true,
		strings = false,
		variables = false,
	},
	bold = {
		functions = true,
		keywords = false,
		types = true,
	},
}

M.options = vim.deepcopy(M.defaults)

function M.setup(options)
	M.options = vim.tbl_deep_extend("force", M.defaults, options or {})
end

return M
