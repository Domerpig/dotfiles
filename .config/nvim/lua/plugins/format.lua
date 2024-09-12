return {
  "stevearc/conform.nvim",
  lazy = false,
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        python = { "black", "ruff" },
        c = { "clang-format" },
        rust = { lsp_format = "prefer" },
        lua = { "stylua" },
      },
    })
    conform.formatters["clang-format"] = {
      append_args = { "--style", "{IndentWidth: 4}" },
    }
    conform.formatters.stylua = {
      append_args = { "--indent-width", "2", "--indent-type", "Spaces" },
    }
  end,
}
