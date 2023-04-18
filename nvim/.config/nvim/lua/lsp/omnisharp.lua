local M = {}

function M.setup(lspc, capabilities)
	local pid = vim.fn.getpid()
	local util = lspc.util
	lspc.omnisharp.setup {
		cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
		capabilities = capabilities,
		root_dir = function(file, _)
			if file:sub(-#".csx") == ".csx" then
				return util.path.dirname(file)
			end
			return util.root_pattern("*.sln")(file) or util.root_pattern("*.csproj")(file)
		end,
		use_mono = true,
		on_attach = function(_, bufnr)
			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
		end
	}
end

return M
