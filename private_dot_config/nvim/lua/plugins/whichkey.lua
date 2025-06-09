return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local wk = require("which-key")
    wk.add({
      { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
      { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to Declaration" },
      { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to Implementation" },
      { "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Go to Type Definition" },

      { "<leader>#", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line" },
      { "<leader>e", "<cmd>Oil<CR>", desc = "Explorer", icon = { icon = "" } },
      { "<leader>x", ":.lua<CR>", desc = "Lua - Source current line" },
      ----- LSP -----
      { "<leader>l", group = "LSP" },
      { "<leader>li", "<cmd>LspInfo<CR>", desc = "Info" },
      { "<leader>q", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Quickfix" },
      { "<leader>lf", "<cmd>lua require('conform').format()<CR>", desc = "Format" },
      {"<leader>ld", "<cmd>lua require('telescope.builtin').diagnostics({sorting_strategy='ascending'})<CR>"},
      { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
      { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Prev Diagnostic" },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", desc = "CodeLens Action" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
      {
        "<leader>lh",
        "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}),{0})<CR>",
        desc = "Toggle hints",
      },
      {
        "<leader>lR",
        "<cmd>lua require('telescope.builtin').lsp_references({sorting_strategy='ascending'})<CR>",
        desc = "References",
      },
      {
        "<leader>ls",
        "<cmd>lua require('telescope.builtin').lsp_document_symbols({sorting_strategy='ascending'})<CR>",
        desc = "Document Symbols",
      },
      {
        "<leader>lS",
        "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols({sorting_strategy='ascending'})<CR>",
        desc = "Workspace Symbols",
      },
      ---- Telescope ----
      { "<leader>s", group = "Find" },
      {
        "<leader>S",
        "<cmd>lua require('telescope.builtin').live_grep({sorting_strategy='ascending'})<CR>",
        desc = "Find Text",
      },
      {
        "<leader>s",
        "<cmd>lua require('telescope.builtin').live_grep({sorting_strategy='ascending',search_dirs={vim.fn.expand('%:p')}})<CR>",
        desc = "Find Text within open file",
      },
      {
        "<leader>f",
        "<cmd>lua require('telescope.builtin').find_files()<CR>",
        desc = "Find file",
      },
      ----- Plugins -----
      { "<leader>p", group = "Plugin" },
      { "<leader>pp", "<cmd>Lazy<CR>", desc = "Plugin manager" },
      { "<leader>pm", "<cmd>Mason<CR>", desc = "Installer Info" },

      ----- DAP -----
      { "<leader>d", group = "DAP" },
      { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
      { "<leader>db", "<cmd>lua require'dap'.step_back()<CR>", desc = "Step Back" },
      { "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue" },
      { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<CR>", desc = "Run To Cursor" },
      { "<leader>dd", "<cmd>lua require'dap'.disconnect()<CR>", desc = "Disconnect" },
      { "<leader>dg", "<cmd>lua require'dap'.session()<CR>", desc = "Get Session" },
      { "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step Into" },
      { "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", desc = "Step Over" },
      { "<leader>du", "<cmd>lua require'dap'.step_out()<CR>", desc = "Step Out" },
      { "<leader>dp", "<cmd>lua require'dap'.pause()<CR>", desc = "Pause" },
      { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", desc = "Toggle Repl" },
      { "<leader>ds", "<cmd>lua require'dap'.continue()<CR>", desc = "Start" },
      { "<leader>dq", "<cmd>lua require'dap'.close()<CR>", desc = "Quit" },
      { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<CR>", desc = "Toggle UI" },

      ----- git -----
      { "<leader>g", group = "git" },
      { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc="Next Hunk" },
      { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc="Prev Hunk" },
      { "<leader>gb", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc="Blame" },
      { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc="Preview Hunk" },
      { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc="Reset Hunk" },
      { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc="Reset Buffer" },
      { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc="Stage Hunk" },
      { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc="Undo Stage Hunk" },
      { "<leader>go", "<cmd>Telescope git_status<cr>", desc="Open changed file" },
      { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc="Diff" },

      ---------------------
      ---- Visual mode ----
      ---------------------

      {
        mode = { "v" },
        {
          "<leader>#",
          '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
          desc = "Comment toggle selected lines",
          mode = "v",
          nowait = true,
          remap = false,
        },
      },
    })
  end,
}
