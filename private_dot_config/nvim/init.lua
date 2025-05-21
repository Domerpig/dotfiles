require("config.options")
require("config.lazy")
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("v", "<space>x", ":.lua<CR>")
vim.api.nvim_create_autocmd('VimLeave', {
  command = 'set guicursor=a:ver25,a:blinkwait700-blinkoff700-blinkon700-Cursor'
})
