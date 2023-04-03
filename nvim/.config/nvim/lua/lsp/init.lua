require('lsp.css')
require('lsp.html')
require('lsp.json')
require('lsp.prisma')
require('lsp.lua')
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
		['<cr>'] = cmp.mapping.confirm({ select = true, cmp.ConfirmBehavior.Replace }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'cmdline' },
		{ name = 'path' },
	},
	snippet = {
		expand = function(args)
			local _, lnum, col, _ = unpack(vim.fn.getpos("."))
			local ltext = vim.api.nvim_buf_get_lines(0, lnum - 1, lnum, true)[1]
			if args.body:match('\n') ~= nil then
				local indent = string.match(ltext, '^%s*')
				local lines = vim.split(args.body, '\n', true)
				lines[1] = (string.match(ltext, '%S.*') or '')..lines[1]
				if indent ~= '' then
					for i, line in ipairs(lines) do
						lines[i] = indent..line
					end
				end
				vim.api.nvim_buf_set_lines(0, lnum - 1, lnum, true, lines)
			else
				local line = ltext:sub(1, col-1) .. args.body .. ltext:sub(col)
				vim.api.nvim_buf_set_lines(0, lnum - 1, lnum, true, {line})
			end
			vim.api.nvim_win_set_cursor(0, {lnum, col+#args.body})
		end,
	},
})
