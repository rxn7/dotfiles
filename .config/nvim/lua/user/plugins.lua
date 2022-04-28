vim.cmd('packadd packer.nvim')
require('packer').startup(
	function()
		use 'morhetz/gruvbox'

		use {
			'mattn/emmet-vim',
			config = "require('user.emmet')"
		}
		use {
			'neovim/nvim-lspconfig',
			config = "require('user.lsp')"
		}
		use {
			'hrsh7th/nvim-cmp',
			requires = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-vsnip',
				'hrsh7th/vim-vsnip',
				'hrsh7th/cmp-path' 
			} 
		}
		use {
			'nvim-treesitter/nvim-treesitter',
			config = "require('user.treesitter')",
			run = ':TSUpdate'
		}
		use {
			'noib3/nvim-cokeline',
			requires = 'kyazdani42/nvim-web-devicons',
			config = "require('user.cokeline')"
		}
		use {
			'nvim-telescope/telescope.nvim',
			requires = 'nvim-lua/plenary.nvim',
		}
		use {
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			config = "require('user.nvim-tree')"
		}
		use {
			'nvim-lualine/lualine.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = "require('user.lualine')"
		}
		use {
			'navarasu/onedark.nvim',
			config = "require('user.onedark')" 
		}
		use {
			'voldikss/vim-floaterm'
		}
	end)
