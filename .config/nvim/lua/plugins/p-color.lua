load('gruber-darker.nvim')
load('transparent.nvim')
vim.cmd("colorscheme gruber-darker")

vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "none", fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "none", fg = "#ffffff" })

