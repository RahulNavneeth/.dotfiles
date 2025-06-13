local options = {
	backup = false,
	clipboard = "unnamedplus",
	-- cmdheight = 0,
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmode = true,
	showtabline = 0,
	tabline = '%=%#MyTabLabelForeground# %{&modified ? "🌻*" : "🌻"}%=',
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 1000,
	guicursor = "",
	undofile = true,
	updatetime = 300,
	writebackup = true,
	expandtab = false,
	shiftwidth = 4,
	tabstop = 4,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 8,
	sidescrolloff = 8,
	laststatus = 3,
}

vim.cmd [[set nrformats+=alpha]]

-- vim.cmd [[highlight Normal guibg=black ctermbg=black]]

for k, v in pairs(options) do
	vim.opt[k] = v
end
