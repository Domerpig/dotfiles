return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- require("onedark").setup {
    --   style = "cool"
    -- }
    require("kanagawa").load()
  end
}
