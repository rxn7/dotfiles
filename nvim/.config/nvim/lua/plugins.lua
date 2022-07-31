require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'https://github.com/kyazdani42/nvim-web-devicons'
	use 'gruvbox-community/gruvbox'
	use { 
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}
	use 'ms-jpq/chadtree'

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmd-cmdline'
	use 'hrsh7th/cmd-path'
	use 'neovim/nvim-lspconfig'
end)
