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
			'akinsho/bufferline.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = "require('user.bufferline')"
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
		use 'frenzyexists/aquarium-vim'
		use 'voldikss/vim-floaterm'
	end)
