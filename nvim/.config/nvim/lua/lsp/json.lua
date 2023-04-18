local M = {}

function M.setup(lspc, capabilities)
	lspc.jsonls.setup({
		capabilities = capabilities,
		cmd = {
			"vscode-json-language-server", "--stdio" 
		},
		filetypes = {
			"json",
			"jsonc"
		},
		init_options = {
			provideFormatter = true,
		},
	})
end

return M
