vim.cmd('packadd packer.nvim')
require('packer').startup(
	function()
		use 'morhetz/gruvbox'

		use {
			'mattn/emmet-vim',
			config = "require('emmet-config')"
		}
		use {
			'neovim/nvim-lspconfig',
			config = "require('lsp-config')"
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
			'noib3/nvim-cokeline',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require('cokeline-config')
			end
		}
		use {
			'nvim-telescope/telescope.nvim',
			requires = 'nvim-lua/plenary.nvim'
		}
		use {
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require('nvim-tree').setup()
			end
		}
	end
)
