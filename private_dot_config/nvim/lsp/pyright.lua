---@type vim.lsp.Config
return {
  cmd = {'pyright-langserver', '--stdio' },
  filetypes = { "lua" },
  root_markers = {
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
  },
}
