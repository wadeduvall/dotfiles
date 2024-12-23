return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  event = "VeryLazy",
  opts = {},
  config = function(_, _)
    require("hardtime").setup()
  end
}
