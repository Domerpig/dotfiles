return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig'
    },
    config = function()
        require('mason').setup()
        require('plugins.LSP.config').setup()
        require('mason-lspconfig').setup()
        require('mason-lspconfig').setup_handlers {
            function(server_name)
                local on_attach = require("plugins.LSP.config").on_attach
                local capabilities = require("plugins.LSP.config").capabilities

                local opts = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }

                require("lspconfig")[server_name].setup(opts)
            end,

            ['rust_analyzer'] = function()
                require("lspconfig").rust_analyzer.setup {
                    flags = flags,
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        ['rust-analyzer'] = {
                            cargo = {
                                allFeatures = true,
                            },
                            checkOnSave = {
                                allFeatures = true,
                                command = 'clippy',
                            },
                        },
                    },
                }
            end,

            ["pyright"] = function()
                require("lspconfig").pyright.setup {
                    capabilities = capabilities,
                    settings = {
                        python = {
                            analysis = {
                                ignore = { '*' }
                            }
                        }
                    }
                }
            end,

            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup {
                    settings = {
                        Lua = {
                            format = {
                                enable = true,
                                -- Put format options here
                                -- NOTE: the value should be String!
                                defaultConfig = {
                                    indent_style = "space",
                                    indent_size = "2",
                                }
                            },
                        }
                    }
                }
            end
        }
    end
}
