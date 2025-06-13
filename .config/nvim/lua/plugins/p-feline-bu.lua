local line_ok, feline = pcall(require, "feline")

if not line_ok then
	return
end

vim.opt.termguicolors = true

local rahulsnvimtheme = {
	fg = "#D0BF9C",
	bg = "#0C0E18",
	green = "#B8BB26",
	yellow = "#FABD2F",
	purple = "#D3869B",
	orange = "#FE8019",
	peanut = "#f6d5a4",
	red = "#FB4934",
	aqua = "#8EC07C",
	darkblue = "#87ADA3",
	dark_red = "#cc241d",
}

local vi_mode_colors = {
	NORMAL = "#83A598",
	OP = "green",
	INSERT = "purple",
	VISUAL = "red",
	LINES = "red",
	BLOCK = "red",
	REPLACE = "red",
	COMMAND = "yellow",
}

local c = {
	vim_mode = {
		icon = {
			str = ""
		},
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
				-- padding = "center", -- Uncomment for extra padding.
			},
		},
		hl = function()
			return {
				bg = require("feline.providers.vi_mode").get_mode_color(),
				fg = "black",
				style = "bold",
				name = require('feline.providers.vi_mode').get_mode_highlight_name(),
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	gitBranch = {
		provider = 'git_branch',
		hl = function()
			return {
				fg = require("feline.providers.vi_mode").get_mode_color(),
				bg = "#111422",
				-- style = "normal",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = rahulsnvimtheme.aqua,
			bg = "#0B0C0E",
		},
		-- left_sep = "block",
		right_sep = "block",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = rahulsnvimtheme.red,
			bg = "#0B0C0E",
		},
		-- left_sep = "block",
		right_sep = "block",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "fg",
			bg = "#0B0C0E",
		},
		-- left_sep = "block",
		-- right_sep = "block",
	},
	separator = {
		provider = "",
	},
	fileinfo = {
		icon = {
			str = ""
		},
		provider = {
			name = "file_info",
			opts = {
				type = "short",
			},
		},
		hl = {
			fg = "#0C0E18",
			bg = "#0C0E18",
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = "red",
		},
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = "yellow",
		},
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = "aqua",
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "purple",
			bg = "#111422",
			-- style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_type = {
		hl = {
			fg = "#F0E6C1",
			bg = "#0B0C0E",
			style = "bold",
		},
		name = "",
		left_sep = "block",
		right_sep = "block",
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "lowercase",
			},
		},
	},
	position = {
		provider = "position",
		hl = function()
			return {
				bg = require("feline.providers.vi_mode").get_mode_color(),
				fg = "black",
				style = "bold",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			bg = "#F0E6C1",
			fg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = {
			fg = "#D0BF9C",
			bg = "darkblue",
			style = "bold",
		},
	},
}

local left = {
	c.vim_mode,
	-- c.gitBranch,
	-- c.gitDiffAdded,
	-- c.gitDiffRemoved,
	-- c.gitDiffChanged,
	-- c.separator,
}

local middle = {
	c.fileinfo,
	-- c.weather_reporto,
	-- c.diagnostic_errors,
	-- c.diagnostic_warnings,
	-- c.diagnostic_info,
	-- c.diagnostic_hints,
}

local right = {
	c.gitBranch,
	-- c.lsp_client_names,
	-- c.file_type,
	-- c.position,
	-- c.line_percentage,
	-- c.scroll_bar,
}

local components = {
	active = {
		left,
		-- middle,
		right,
	},
	inactive = {
		-- left,
		middle,
		-- right,
	},
}

feline.setup({
	components = components,
	theme = rahulsnvimtheme,
	vi_mode_colors = vi_mode_colors,
})
