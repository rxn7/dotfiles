local pid = vim.fn.getpid()
require('lspconfig').omnisharp.setup {
	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
	enable_editorconfig_support = true,
	enable_ms_build_load_projects_on_demand = false,
	enable_roslyn_analyzers = false,
	enable_import_completion = false,
	sdk_include_prereleases = true,
	on_attach = function(client)
		require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	end
}
