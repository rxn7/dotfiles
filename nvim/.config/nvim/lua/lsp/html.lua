local M = {}

function M.setup(lspc, capabilities) 
	capabilities.textDocument.completion.completionItem.snipperSupport = true
	lspc.html.setup({
		capabilities = capabilities,
		cmd = {
			"html-languageserver",
			"--stdio"
		},
		filetypes = {
			"html",
		},
		init_options = {
			configurationSection = {
				"html",
				"css",
				"javascript",
			},
			embeddedLanguages = {
				css = true,
				javascript = true,
			}
		}
	})
end

return M
