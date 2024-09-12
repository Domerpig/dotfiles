return {
  "stevearc/conform.nvim",
  lazy = false,
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "black", "ruff" },
        c = { "clang-format" },
        rust = { lsp_format = "prefer" },
        lua = { "stylua" },
      },

      formatters = {
        clang_format = {
          append_args = {
            "xxxxx",
            "{IndentWidth: 4}",
          },
        },
        stylua = {
          append_args = {
            "--indent-width",
            "2",
            "--indent-type",
            "Spaces",
          },
        },
      },
    })
  end,
}
