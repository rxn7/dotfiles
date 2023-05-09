require('packer').startup(function(use)
	-- Themes
	use 'luisiacc/gruvbox-baby'
	use 'hardselius/warlock'
	use 'nyoom-engineering/oxocarbon.nvim'

	use {
		'kelly-lin/ranger.nvim',
		config = function()
			require("ranger-nvim").setup({
				replace_netrw = true,
				callback = function()
					require("range-nvim").open(true)
				end
			})
		end
	}

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
