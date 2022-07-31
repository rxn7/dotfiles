local lsp_config = require('lspconfig')
local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

if cmp == nil or lsp_config == nil then return end

cmp.setup({
	mapping = {
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<cr>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		 { name = 'nvim_lsp' },
		 { name = 'cmdline' },
		 { name = 'path' },
	},
})

lsp_config.tsserver.setup({ capabilities = capabilities, })
lsp_config.clangd.setup({ capabilities = capabilities, })
lsp_config.sumneko_lua.setup(require('lsp/sumneko_lua'))
