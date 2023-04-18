local M = {}

function M.setup(lspc, capabilities)
	lspc.prismals.setup({
		capabilities = capabilities,
		root_dir = function()
			return vim.loop.cwd()
		end
	})
end

return M
