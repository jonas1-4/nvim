local neogit = require('neogit')

neogit.setup {}

vim.keymap.set("n", '<leader>gg', '<cmd>Neogit<cr>', { noremap = true, silent = true, desc = 'Open Neogit' })
