load('nvim-treesitter')

local parser_dir = vim.fn.expand("~/.local/tree-sitter")
vim.fn.mkdir(parser_dir, "p")

vim.opt.runtimepath:prepend(parser_dir)
vim.env.TREE_SITTER_DIR = parser_dir
-- vim.loop.fs_chmod(parser_dir, 0x1ED)

require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "cpp",
        "css", 
        "lua",
        "vim",
        "html",
        "query",
        "vimdoc",
        "haskell",
        "markdown",
        "javascript",
        "typescript",
        "markdown_inline",
    },
    sync_install = false,
    auto_install = true,
	parser_install_dir = parser_dir,
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
}
