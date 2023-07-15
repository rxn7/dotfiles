local lspc = require('lspconfig')
local cmp = require('cmp')

if cmp == nil or lspc == nil then return end

cmp.setup({
	mapping = {
		['<C-Space>'] = cmp.mapping.complete(),
		['C-f'] = cmp.mapping.scroll_docs(-4),
		['C-b'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<cr>'] = cmp.mapping.confirm({ select = false }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'path' },
		{ name = 'buffer' },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
})

require('mason').setup()
