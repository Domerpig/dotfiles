return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "OXY2DEV/markview.nvim",
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "lua",
        "python",
        "markdown",
        "zig",
        "rust",
        "json",
        "make",
        "toml",
        "yaml",
        "go",
        "fish",
        "bash",
        "dockerfile",
        "desktop",
        "gosum",
        "gomod",
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},

      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,

        additional_vim_regex_highlighting = false,
      },
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = { query = "@function.outer", desc = "Select around function" },
            ["if"] = { query = "@function.inner", desc = "Select in function" },
            ["ac"] = { query = "@class.outer", desc = "Select around class" },
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = { query = "@class.inner", desc = "Select in class" },
            -- You can also use captures from other query groups like `locals.scm`
            ["s"] = { query = "@local.scope", query_group = "locals", desc = "Select scope" },
            ["p"] = { query = "@parameter.inner", desc = "Select param" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next param" },
          },
          swap_previous = {
            ["<leader>A"] = { query = "@parameter.inner", desc = "Swap with prev param" },
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "Go to next function start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]p"] = { query = "@parameter.inner", desc = "Go to next class end" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "Go to next function end" },
            ["]C"] = { query = "@class.outer", desc = "Go to next class end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "Go to prev function start" },
            ["[c"] = { query = "@class.outer", desc = "Go to prev class start" },
            ["[p"] = { query = "@parameter.inner", desc = "Go to prev class start" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", desc = "Go to prev function end" },
            ["[C"] = { query = "@class.outer", desc = "Got to prev class end" },
          },
        },
      },
    })
  end,
}
