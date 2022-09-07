local lspc = require('lspconfig')
local root_pattern = lspc.util.root_pattern

lspc.tsserver.setup({
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	cmd = {
		"typescript-language-server", "--stdio"
	},
	root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", "index.js", "app.js");
})
