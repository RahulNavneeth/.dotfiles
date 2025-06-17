vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'neovim/nvim-lspconfig'
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}
	use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
	use 'windwp/nvim-autopairs'
	use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.x', requires = { { 'nvim-lua/plenary.nvim' } } }
	use {
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
		keys = {
			{ "<c-K>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-J>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-K>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-L>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		},
	}

	-- CMP
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'

	-- TOOLS
	use 'mbbill/undotree'
	use 'ThePrimeagen/harpoon'
	use 'sudoerwx/vim-ray-so-beautiful'
	use 'andweeb/presence.nvim'
	use 'bitspaceorg/weather-reporto.nvim'
end)
