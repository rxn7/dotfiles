require('packer').startup(function(use)
	-- Looks
	use 'kyazdani42/nvim-web-devicons'
	use 'luisiacc/gruvbox-baby'
	use "rebelot/kanagawa.nvim"
	use 'nvim-lualine/lualine.nvim'

	-- Telescope
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
	use {
		'williamboman/mason.nvim',
		"williamboman/mason-lspconfig.nvim",
		run = ':MasonUpdate',
	}

	-- Other
	use { 
		'wbthomason/packer.nvim',
		run = ":PackerSync"
	}
	use 'nvim-tree/nvim-tree.lua'
	use 'sheerun/vim-polyglot'
	use 'akinsho/toggleterm.nvim'
	use {
		'akinsho/git-conflict.nvim',
		tag = "*",
		config = function()
			require('git-conflict').setup({})
		end
	}
end)
