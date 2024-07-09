require("keymaps")
require("pluginmanager")
require("options")
vim.o.background = "dark" -- or "light" for light mode
vim.cmd.colorscheme "onedark"
vim.api.nvim_create_autocmd('VimLeave', {
  command = 'set guicursor=a:ver25,a:blinkwait700-blinkoff700-blinkon700-Cursor'
})
