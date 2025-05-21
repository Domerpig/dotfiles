---@type vim.lsp.Config
return {
  cmd = { "zls" },
  filetypes = { "zig", "zir" },
  root_markers = { "zls.json", "build.zig", ".git" },
  settings = {
    zls = {
      build_on_save_args = { "-fincremental" },
    },
  },
}
