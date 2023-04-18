local M = {}

function M.setup(lspc, capabilities)
	lspc.rust_analyzer.setup({
		capabilities = capabilities
	})
end

return M
