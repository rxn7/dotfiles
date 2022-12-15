local configs = require('nvim-treesitter.configs')

configs.setup({
	sync_install = false,
	ignore_install = {
	},
	highlight = {
		enable = true,
		disable = {
		},
		additional_vim_regex_highlighting = false,
	},
	ident = {
		enable = true,
		disable = {
			"yaml",
		}
	}
})
