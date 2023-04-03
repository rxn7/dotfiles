require('lspconfig').lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- Make the language server aware of nvim runtime files
				library = vim.api.nvim_get_runtime_file("", true)
			},
			telemetry = {
				enable = false,
			},
		}
	}
})
