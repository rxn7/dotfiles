local status, telescope = pcall(require, 'telescope')
if not status then return end

telescope.setup({
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
		}
	},
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--ignore-file',
			'.gitignore',
		},
	}
})

telescope.load_extension("file_browser")
