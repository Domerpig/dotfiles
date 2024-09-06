return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      'nvim-telescope/telescope-media-files.nvim'
    },
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
         triggers = {
             { "<leader>", mode = { "n", "v" } },
         }
    },
    config = function()
        local wk = require("which-key")
        wk.add({
            ---------------------
            -- Normal mode ------
            ---------------------

            { "<leader>#", "<Plug>(comment_toggle_linewise_current)", desc="Comment toggle current line"},
            { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc="Buffers"},
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc="Explorer"},
            { "<leader>F", "<cmd>lua require('telescope.builtin').live_grep({sorting_strategy='ascending'})<cr>", desc="Find Text"},
            { "<leader>f", "<cmd>lua require('telescope.builtin').live_grep({sorting_strategy='ascending',search_dirs={vim.fn.expand('%:p')}})<cr>", desc="Find Text within open file"},
            { "<leader>m", "<cmd>MarkdownPreviewToggle<cr>", desc="Toggle Markdown preview"},
            ----- LSP -----
            { "<leader>l", group="LSP"},
            { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc="Code Action"},
            { "<leader>ld", "<cmd>lua require('telescope.builtin').diagnostics({sorting_strategy='ascending'})<cr>", desc="LSP Diagnostics"},
            { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc="Format"},
            { "<leader>li", "<cmd>LspInfo<cr>", desc="Info"},
            { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc="Next Diagnostic"},
            { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc="Prev Diagnostic"},
            { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc="CodeLens Action"},
            { "<leader>lq", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc="Quickfix"},
            { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc="Rename"},
            { "<leader>lR", "<cmd>lua require('telescope.builtin').lsp_references({sorting_strategy='ascending'})<cr>", desc="References"},
            { "<leader>ls", "<cmd>lua require('telescope.builtin').lsp_document_symbols({sorting_strategy='ascending'})<cr>", desc="Document Symbols"},
            { "<leader>lS", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols({sorting_strategy='ascending'})<cr>", desc="Workspace Symbols"},
            ----- git -----
            { "<leader>g", group="git"},
            { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc="Next Hunk"},
            { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc="Prev Hunk"},
            { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc="Blame"},
            { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc="Preview Hunk"},
            { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc="Reset Hunk"},
            { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc="Reset Buffer"},
            { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc="Stage Hunk"},
            { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc="Undo Stage Hunk"},
            { "<leader>go", "<cmd>Telescope git_status<cr>", desc="Open changed file"},
            { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc="Checkout branch"},
            { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc="Checkout commit"},
            { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc="Diff"},
            ----- Search -----
            { "<leader>s", group="Search"},
            { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc="Checkout branch"},
            { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc="Find Help"},
            { "<leader>sm", "<cmd>Telescope man_pages<cr>", desc="Man Pages"},
            { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc="Open Recent File"},
            { "<leader>sR", "<cmd>Telescope registers<cr>", desc="Registers"},
            { "<leader>sk", "<,cmd>Telescope keymaps<cr>", desc="Keymaps"},
            { "<leader>sc", "<cmd>Telescope commands<cr>", desc="Commands"},
            { "<leader>sf", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc="Find files"},

            ----- Plugins -----
            { "<leader>p", group="Plugin"},
            { "<leader>pp", "<cmd>Lazy<cr>", desc="Plugin manager"},
            { "<leader>pm", "<cmd>Mason<cr>", desc="Installer Info"},

            ---------------------
            ---- Visual mode ----
            ---------------------

            {
                mode = {"v"},
               { "<leader>#", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', desc = "Comment toggle selected lines", mode = "v", nowait = true, remap = false },
            }
        })

        local opts = {
            debug = true
        }
    end
}
