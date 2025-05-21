return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        -- Same values as the general color option can be used here.
        error = "DiagnosticError", -- Changes diagnostics' error color.
        warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
        info = "DiagnosticInfo", -- Changes diagnostics' info color.
        hint = "DiagnosticHint", -- Changes diagnostics' hint color.
      },
      colored = true,
      update_in_insert = false,
      always_visible = true,
    }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    }

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", diff, diagnostics},
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progess" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
