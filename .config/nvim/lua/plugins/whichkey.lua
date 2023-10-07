return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        ---------------------
        -- Normal mode ------
        ---------------------
        local opts = {
            mode = "n",
            prefix = "<leader>",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = true -- use `nowait` when creating keymaps
        }

        local mappings = {
            ["#"] = {"<Plug>(comment_toggle_linewise_current)", "Comment toggle current line"},
            ["b"] = {"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
                     "Buffers"},
            ["e"] = {"<cmd>Neotree toggle<cr>", "Explorer"},
            ["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
            ["f"] = { "<cmd>lua require('telescope.builtin').live_grep({search_dirs={vim.fn.expand('%:p')}})<cr>", "Find Text within open file" },

            ----- Terminal -----
            t = {
                name = "Terminal",
                t = {"<cmd>lua _HTOP_TOGGLE()<cr>", "Htop"},
                f = {"<cmd>ToggleTerm direction=float<cr>", "Float"},
                g = {"<cmd>lua _GITUI_TOGGLE()<cr>", "GitUI"}
            },

            ----- LSP -----
            l = {
              name = "LSP",
              a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
              d = { "<cmd>Telescope diagnostics<cr>", "LSP Diagnostics" },
              f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
              i = { "<cmd>LspInfo<cr>", "Info" },
              j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
              k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
              l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
              q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
              r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
              R = { "<cmd>Telescope lsp_references<cr>", "References"},
              s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
              S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" }
            },

            ----- git -----
            g = {
              name = "Git",
              j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
              k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
              l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
              p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
              r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
              R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
              s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
              u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
              o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
              b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
              c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
              d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
            },

            ----- Search -----
            s = {
              name = "Search",
              b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
              h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
              m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
              r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
              R = { "<cmd>Telescope registers<cr>", "Registers" },
              k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
              c = { "<cmd>Telescope commands<cr>", "Commands" },
              f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Find files" },
            },

            ----- DAP -----
            d = {
              name = "Debug",
              t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
              b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
              c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
              C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
              d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
              g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
              i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
              o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
              u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
              p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
              r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
              s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
              q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
              U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
            },

            ----- Plugins -----
            p = {
             p = { "<cmd>Lazy<cr>", "Plugin manager" },
             m = { "<cmd>Mason<cr>", "Installer Info" }
            }
        }

        ---------------------
        ---- Visual mode ----
        ---------------------
        local vopts = {
            mode = "v",
            prefix = "<leader>",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = true -- use `nowait` when creating keymaps
        }
        local vmappings = {
            ["/"] = {"<ESC><CMD>lua require(\"Comment.api\").toggle.linewise(vim.fn.visualmode())<CR>", "Comment toggle selected lines"}
        }

        local which_key = require("which-key")
        which_key.register(mappings, opts)
        which_key.register(vmappings, vopts)
    end
}
