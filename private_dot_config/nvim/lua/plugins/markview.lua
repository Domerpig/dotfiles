return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    local markview = require("markview")
    markview.setup({
      experimental = {
        check_rtp_message = false,
      },
    })
  end,
}
