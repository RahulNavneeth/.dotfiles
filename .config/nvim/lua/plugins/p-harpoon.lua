load('harpoon')
local mark = require('harpoon.mark');
local ui = require('harpoon.ui');

vim.keymap.set('n', '<C-w>a', mark.add_file)
vim.keymap.set('n', '<C-w>m', ui.toggle_quick_menu);

vim.keymap.set('n', '<C-w>1', function() ui.nav_file(1) end);
vim.keymap.set('n', '<C-w>2', function() ui.nav_file(2) end);
vim.keymap.set('n', '<C-w>3', function() ui.nav_file(3) end);
vim.keymap.set('n', '<C-w>4', function() ui.nav_file(4) end);

require("telescope").load_extension('harpoon')

require("harpoon").setup({
	menu = {
		width = math.floor(vim.api.nvim_win_get_width(0) / 2),
	}
})
