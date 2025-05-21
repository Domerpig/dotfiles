return {
  "saghen/blink.cmp",
  -- optional: provides snippets for the snippet source
  version = "v1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = {
      preset = "default",
      ["<C-j>"] = { "select_next" },
      ["<C-k>"] = { "select_prev" },
      ["<CR>"] = { "select_and_accept", "fallback" },
    },

    ---@diagnostic disable-next-line: missing-fields
    signature = { enabled = true },

    ---@diagnostic disable-next-line: missing-fields
    appearance = {
      use_nvim_cmp_as_default = true,
    },

    snippets = {
      preset = "luasnip",
      expand = function(snippet)
        require("luasnip").lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require("luasnip").jumpable(filter.direction)
        end
        return require("luasnip").in_snippet()
      end,
      jump = function(direction)
        require("luasnip").jump(direction)
      end,
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    ---@diagnostic disable-next-line: missing-fields
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    cmdline = {
      enabled = true,
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
      },
    },

    -- experimental signature help support
    -- signature = { enabled = true }
  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { "sources.default" },
}
