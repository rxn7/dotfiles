local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local opts = { noremap = true, silent = true }

	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'ccls' }
for _, serv in pairs(servers) do
	nvim_lsp[serv].setup {
		on_attach = on_attach
	}
end

nvim_lsp.omnisharp.setup {
	cmd = { "/bin/omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	on_attach = on_attach
}

nvim_lsp.sumneko_lua.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

local cmp = require('cmp')
cmp.setup {
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'path' },
		{ name = 'treesitter' },
	},

	mapping = {
		['<cr>'] = cmp.mapping.confirm({select = true}),
		['<s-tab>'] = cmp.mapping.select_prev_item(),
		['<tab>'] = cmp.mapping.select_next_item(),
	},
}
