return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
      local actios = require("telescope.actions")
      require("telescope").setup{
          defaults = {
              mappings = {
                  i = {
                      ["<C-j>"] = actios.move_selection_next,
                      ["<C-k>"] = actios.move_selection_previous
                  }
              }
          }
      }
      require("telescope").load_extension("media_files")
      require('telescope').load_extension('fzf')
      require("plugins.telescope.multigrep")
  end
}
