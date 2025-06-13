vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'mrcjkb/haskell-tools.nvim'
	use 'xiyaowong/transparent.nvim'
	use 'jackplus-xyz/binary.nvim'
	use 'blazkowolf/gruber-darker.nvim'
	use 'scottmckendry/cyberdream.nvim'
	use {
		'nvim-flutter/flutter-tools.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'mhanberg/elixir.nvim'
	use 'rose-pine/neovim'
	use {
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		-- config = function()
		--     vim.g.zenbones_darken_comments = 45
		--     vim.cmd.colorscheme('zenbones')
		-- end
	}
	use 'neovim/nvim-lspconfig'
	use 'maxmx03/solarized.nvim'
	use({ 'projekt0n/github-nvim-theme' })
	use 'yorickpeterse/nvim-grey'
	use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" } })
	use({
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	})
	use({
		"epwalsh/obsidian.nvim",
		tag = "*",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "main",
						path =
						"/Users/rahulnavneeth/Library/Mobile Documents/iCloud~md~obsidian/Documents/rahulnavneeth's obsidian",
					}
				},
			})
		end,
	})
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}
	use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
	-- use 'nvim-tree/nvim-tree.lua'
	-- use 'nvim-tree/nvim-web-devicons'
	use 'sainnhe/gruvbox-material'
	-- use 'ap/vim-css-color'
	-- use 'rmagatti/alternate-toggler'
	use 'windwp/nvim-autopairs'
	-- use 'mg979/vim-visual-multi'
	-- use 'tpope/vim-surround'
	-- use 'famiu/feline.nvim'
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
	use 'github/copilot.vim'

	-- CMP
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'

	-- SYNTAX
	use 'evanleck/vim-svelte'
	use 'prisma/vim-prisma'

	-- TOOLS
	-- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
	use 'mbbill/undotree'
	-- use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
	use 'ThePrimeagen/harpoon'
	use 'sudoerwx/vim-ray-so-beautiful'
	use { 'goolord/alpha-nvim', config = function() require 'alpha'.setup(require 'alpha.themes.dashboard'.config) end }
	use 'andweeb/presence.nvim'
	-- use 'bitspaceorg/weather-reporto.nvim'
end)
