require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'
	use 'phha/zenburn.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'sheerun/vim-polyglot'
	use 'voldikss/vim-floaterm'

	-- Telscope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
	}

	-- LSP
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-path'
	use 'neovim/nvim-lspconfig'
	use 'mattn/emmet-vim'
end)
