local lsp = require('lspconfig')

lsp.rust_analyzer.setup({
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
})

lspconfig.clangd.setup({
    on_attach = lsp_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern(
      '.clangd'
      ,'.clang-tidy'
      ,'.clang-format'
      ,'compile_commands.json'
      ,'compile_flags.txt'
      ,'configure.ac'
      ,'.git'
      ),
    single_file_support = true,
})
