vim.cmd('packadd packer.nvim')
require('packer').startup(
	function()
		use {
			'mattn/emmet-vim',
			config = "require('user.emmet')"
		} use {
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
			'akinsho/bufferline.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = "require('user.bufferline')"
		}
		use {
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			config = "require('user.nvim-tree')"
		}
		use 'cloudhead/neovim-fuzzy'
		use 'voldikss/vim-floaterm'
		use 'leafgarland/typescript-vim'
	end)
