require('lsp.sumneko_lua')
require('lsp.css')
require('lsp.html')
require('lsp.json')
require('lsp.prisma')
require('lsp.sumneko_lua')
require('lsp.typescript')
require('lsp.clangd')
require('lsp.rust')
require('lsp.omnisharp')

local lsp_config = require('lspconfig')
local cmp = require('cmp')

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
		 { name = 'vsnip' },
		 { name = 'nvim_lsp' },
		 { name = 'cmdline' },
		 { name = 'path' },
	},
})
