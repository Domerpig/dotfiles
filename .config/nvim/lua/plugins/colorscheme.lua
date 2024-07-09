return {
  "navarasu/onedark.nvim",
  name = "onedark",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("onedark").setup {
      style = "cool"
    }
    require("onedark").load()
  end
}
