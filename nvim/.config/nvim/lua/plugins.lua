require('packer').startup(function(use)
	-- Look
	use 'kvrohit/rasmus.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'

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
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use 'mattn/emmet-vim'

	use 'cdelledonne/vim-cmake'
	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-tree.lua'
	use 'sheerun/vim-polyglot'
	use 'voldikss/vim-floaterm'
	use {
		'akinsho/git-conflict.nvim',
		tag = "*",
		config = function()
			require('git-conflict').setup()
		end
	}
end)
