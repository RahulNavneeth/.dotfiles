vim.opt.list = true
vim.cmd [[
    let g:indent_blankline_char = '│'
]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#0D245F  gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#0D245F  gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#0D245F  gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#0D245F  gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#0D245F  gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#0D245F  gui=nocombine]]

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
