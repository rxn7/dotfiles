local status, packer = pcall(require, "packer")
if not status then return end

packer.startup(function(use)
	-- Essential
	use {
		'wbthomason/packer.nvim',
		run = ":PackerSync"
	}
	use 'numToStr/Comment.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'sheerun/vim-polyglot'
	use 'tweekmonster/startuptime.vim'
	use 'nvim-tree/nvim-tree.lua'
	use 'akinsho/toggleterm.nvim'

	-- Looks
	use 'kyazdani42/nvim-web-devicons'
	use 'catppuccin/nvim'
	use 'savq/melange-nvim'
	use 'nvim-lualine/lualine.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
		}
	}

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
	}

	-- Cmp
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'

	-- Snippets
	use 'hrsh7th/vim-vsnip'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use {
		'williamboman/mason.nvim',
		"williamboman/mason-lspconfig.nvim",
		run = ':MasonUpdate',
	}

	-- Other
	use 'mattn/emmet-vim'
	use {
		'akinsho/git-conflict.nvim',
		tag = "*",
		config = function()
			require('git-conflict').setup({})
		end
	}
end)
