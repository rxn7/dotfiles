require('packer').startup(function(use)
	use 'nvim-tree/nvim-tree.lua'

	-- Themes
	use 'luisiacc/gruvbox-baby'
	use "rebelot/kanagawa.nvim"

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
	use {
		'williamboman/mason.nvim',
		"williamboman/mason-lspconfig.nvim",
		run = ':MasonUpdate',
	}

	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'wbthomason/packer.nvim'
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
