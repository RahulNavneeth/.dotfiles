local api = vim.api

-- This sets the key mapping 'vv' to the action of pressing Control-v in normal mode
api.nvim_set_keymap('n', 'vv', '<C-v>', { noremap = true })

-- This sets the key mapping 'PP' to the action of pressing ':bn<CR>' in normal mode
api.nvim_set_keymap('n', 'PP', ':bn<CR>', { noremap = true })

-- This sets the key mapping 'OO' to the action of pressing ':bp<CR>' in normal mode
api.nvim_set_keymap('n', '[[', ':bp<CR>', { noremap = true })

-- This sets the key mapping 'J' in visual mode to move the current selection down one line and then reselect the visual block
api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })

-- This sets the key mapping 'K' in visual mode to move the current selection up one line and then reselect the visual block
-- api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })

-- This sets the key mapping 'J' in normal mode to join the current line with the one below it
api.nvim_set_keymap('n', 'J', "mzJ`z", { noremap = true })

-- This sets the key mapping Control-d in normal mode to scroll down half a page and then center the screen on the cursor position
api.nvim_set_keymap('n', '<C-d>', "<C-d>zz", { noremap = true })

-- This sets the key mapping Control-u in normal mode to scroll up half a page and then center the screen on the cursor position
api.nvim_set_keymap('n', '<C-u>', "<C-u>zz", { noremap = true })


-- This sets the key mapping '<space>undo' to toggle the undotree window in normal mode
api.nvim_set_keymap('n', '<space>undo', ":UndotreeToggle<CR>", { noremap = true })

-- This sets the key mapping 'cls' to clear any current search highlighting in normal mode
api.nvim_set_keymap('n', 'cls', ":noh<CR>", { noremap = true })

-- vim.api.nvim_set_keymap('n', '<space>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- OBS
vim.keymap.set("n", "<space>of", vim.cmd.ObsidianQuickSwitch)
vim.keymap.set("n", "<space>og", vim.cmd.ObsidianSearch)
vim.keymap.set("n", "gs", vim.cmd.ObsidianFollowLink)
vim.keymap.set("n", "gs", vim.cmd.ObsidianFollowLink)

vim.keymap.set({ 'n', 'v', 'x' }, 'g-', function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-x>', true, false, true), 'n', true)
end, { noremap = true, silent = true })

vim.keymap.set({ 'n', 'v', 'x' }, 'g+', function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-a>', true, false, true), 'n', true)
end, { noremap = true, silent = true })

--open flutter tools commands
vim.keymap.set('n', '<space>fl', require('telescope').extensions.flutter.commands, { desc = 'Open command Flutter' })

vim.api.nvim_command('command! W noautocmd w')
