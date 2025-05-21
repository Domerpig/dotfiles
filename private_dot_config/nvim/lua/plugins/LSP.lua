return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local config = {
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.ERROR] = "",
        },
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(config)

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover({border='rounded'})<CR>")
    vim.lsp.inlay_hint.enable(true)

    require("mason").setup()

    vim.lsp.enable({"zls"})
    vim.lsp.enable({"clangd"})
    vim.lsp.enable({"rust_analyzer"})
    vim.lsp.enable({"gopls"})
    vim.lsp.enable({"pyright"})
    vim.lsp.enable({"cssls"})

    ---@diagnostic disable-next-line: missing-fields
    require("mason-lspconfig").setup({
      ensure_installed = { "rust_analyzer", "pyright", "jsonls", "clangd", "gopls", "lua_ls", "zls" },
    })
  end,
}

