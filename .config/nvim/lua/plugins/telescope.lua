return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.3",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-media-files.nvim",
  },
  config = function()
    require("telescope").load_extension("media_files")
    require("telescope").setup()
  end,
}

