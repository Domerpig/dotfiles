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
    require('mason-lspconfig').setup_handlers{
      function(server_name)
        local on_attach = require("plugins.LSP.config").on_attach
        local capabilities = require("plugins.LSP.config").capabilities
    
        local opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }
    
        require("lspconfig")[server_name].setup(opts)
      end
    }
  end
}