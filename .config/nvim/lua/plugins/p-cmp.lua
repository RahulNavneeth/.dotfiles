load('nvim-cmp')
load('cmp-nvim-lsp')
load('luasnip')
load('cmp_luasnip')
load('friendly-snippets')

load('comment.nvim')
require('Comment').setup()

load('cmp')
local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-SPACE>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	}),
	window = {
		completion = {
			border = 'none',
			scrollbar = false,
			winhighlight = "Normal:CmpNormal,CursorLine:CmpCursorLine",
		}
	}
})
