local status, packer = pcall(require, 'packer')
if not status then return end

packer.startup(function(use)
	-- Essential
	use {
		'wbthomason/packer.nvim',
		run = ':PackerSync'
	}
	use 'nvim-lua/plenary.nvim'
	use 'numToStr/Comment.nvim'
	use 'sheerun/vim-polyglot'
	use 'tweekmonster/startuptime.vim'
	use 'akinsho/toggleterm.nvim'

	-- Looks
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'

	-- Themes
	use 'neanias/everforest-nvim'

	-- Telescope
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}

	-- Cmp
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/vim-vsnip'

	-- LSP
	use 'lommix/godot.nvim'
	use 'neovim/nvim-lspconfig'
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		run = ':MasonUpdate',
	}

	-- Other
	use {
		'Exafunction/codeium.vim',
		config = function()
			vim.keymap.set('i', '<c-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
			vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
			vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
			vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
		end
	}

	use 'mattn/emmet-vim'
	use {
		'akinsho/git-conflict.nvim',
		tag = '*',
		config = function()
			require('git-conflict').setup({})
		end
	}
end)
