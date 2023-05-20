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
  capabilities = {
    completion = {
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
        ['<C-p>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item(cmp_select_opts)
          else
            cmp.complete()
          end
        end),
        ['<C-n>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item(cmp_select_opts)
          else
            cmp.complete()
          end
        end),
      },
      completionItem = {
        snippetSupport = true,
        preselectSupport = true,
        labelDetailsSupport = true,
        insertReplaceSupport = true,
        resolveSupport = {
          properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
          }
        },
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = {
          valueSet = { 1 }
        },
        insertTextModeSupport = {
          valueSet = { 1 }
        },
        documentationFormat = {
          valueSet = { 'markdown', 'plaintext' }
        },
        maxCompletionItems = 5, -- Set the maximum number of suggestions to 5
      },
    },
  },
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition)
-- vim.keymap.set("i", "<CR>", cmp.mapping.confirm, {select = true})
