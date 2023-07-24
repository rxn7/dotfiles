require('nvim-tree').setup({
	sort_by = 'case_sensitive',
	view = {
		side = 'right',
		width = 30,
	},
	renderer = {
		group_empty = true,
		highlight_opened_files = "icon",
		highlight_modified = "icon",
	},
	filters = {
		dotfiles = true,
	}
})
