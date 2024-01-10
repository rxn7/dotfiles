local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
	sort_by = 'case_sensitive',
	view = {
		side = 'right',
		width = 60,
	},
	renderer = {
		group_empty = false,
		highlight_opened_files = "icon",
		highlight_modified = "icon",
	},
	filters = {
		dotfiles = false,
	},
	actions = {
		open_file = {
			quit_on_open = true
		}
	}
})
