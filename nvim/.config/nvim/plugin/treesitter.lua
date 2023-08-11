local status, configs = pcall(require, 'nvim-treesitter.configs')
if not status then return end

configs.setup({
	sync_install = true,
	ignore_install = {
	},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	ident = {
		enable = true,
		disable = {
			"yaml",
		}
	}
})
