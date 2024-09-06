return {
  'mhartington/formatter.nvim',
  opts = {
      -- add any options here
  },
  lazy = false,
  config = function()
    require("formatter").setup{
            filetype = {
                python = {
                    require("formatter.filetypes.python").black
                }
            }
        }
  end
}

