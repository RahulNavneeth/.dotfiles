load('plenary.nvim')
load('telescope.nvim')
require("telescope").setup{}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

local telescope = require('telescope')

telescope.setup({
	defaults = {
		theme                = 'ivy',
		previewer            = true,
		file_ignore_patterns = { 'node_modules', 'package-lock.json' },
		initial_mode         = 'insert',
		select_strategy      = 'reset',
		sorting_strategy     = 'ascending',
		layout_strategy      = 'horizontal',
		layout_config        = {
			width = 0.85,
			height = 0.85,
			prompt_position = "bottom",
			preview_cutoff = 1,
			preview_width = 0.5,
		},
		path_display         = { "smart" },
		winblend             = 0,
		border               = true,
		borderchars          = {
			"─",
			"│",
			"─",
			"│",
			"╭",
			"╮",
			"╯",
			"╰",
		},
		color_devicons       = true,
		set_env              = { ["COLORTERM"] = "truecolor" },
		vimgrep_arguments    = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
		pickers              = {
			find_files = {
				hidden = true,
				previewer = true,
				layout_config = {
					horizontal = {
						width = 0.85,
						height = 0.85,
						preview_width = 0.5,
					},
				},
			},
		},
	},
})
