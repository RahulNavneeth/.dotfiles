local lspconfig = require('lspconfig')
local utils = require('lspconfig/util')

lspconfig.pyright.setup {}
lspconfig.ts_ls.setup {}
lspconfig.rust_analyzer.setup {
	settings = {
		['rust-analyzer'] = {},
	},
}

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)

		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end
		})
	end,
})

local on_attach = function(_, bufnr)
	-- format on save
	vim.api.nvim_create_autocmd('BufWritePre', {
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format()
		end
	})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_config = {
	group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
	capabilities = capabilities,
	on_attach = function(_, bufnr)
		on_attach(_, bufnr)
	end
}

require('mason-lspconfig').setup_handlers({
	function(server_name)
		require('lspconfig')[server_name].setup(lsp_config)
	end,
	lua_ls = function()
		require('lspconfig').lua_ls.setup(vim.tbl_extend('force', lsp_config, {
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }
					}
				}
			}
		}))
	end,
})

lspconfig.gopls.setup({
	capabilities = capabilities,
	cmd = {
		"gopls",
	},
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = utils.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
		},
	},
})

vim.keymap.set('n', '<leader>o', '<cmd>TypescriptOrganizeImports<cr>')
vim.keymap.set('n', '<leader>a', '<cmd>TypescriptAddMissingImports<cr>')
vim.keymap.set('n', '<leader>r', '<cmd>TypescriptRemoveUnused<cr>')

-- OCaml
vim.opt.rtp:append("/Users/rahulnavneeth/.opam/default/share/ocp-indent/vim")
