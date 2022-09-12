local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snipperSupport = true

require('lspconfig').html.setup({
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
