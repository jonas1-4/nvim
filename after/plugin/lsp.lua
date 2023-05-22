local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'eslint',
})

lsp.nvim_workspace()

lsp.configure('tsserver', {
	settings = {
		completions = {
			completeFunctionCalls = true
		}
	}
})

local default_node_modules = vim.fn.getcwd() .. "/node_modules"

local ngls_cmd = {
	"ngserver",
	"--stdio",
	"--tsProbeLocations",
	default_node_modules,
	"--ngProbeLocations",
	default_node_modules,
	"--experimental-ivy",
}

lsp.setup({
	cmd = ngls_cmd,
	filetypes = { "typescript", "typescriptreact", "html", "typescript.tsx" },
	on_attach = function(client)
		require('lsp-utils').on_attach(client)
	end,
})

local cmp_action = require("lsp-zero").cmp_action()
cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	},
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition)
-- vim.keymap.set("i", "<CR>", cmp.mapping.confirm, {select = true})
