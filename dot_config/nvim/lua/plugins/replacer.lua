return {
  "gabrielpoca/replacer.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  keys = {
    {
      "<leader>ri",
      function()
        require("replacer").run()
      end,
      desc = "run replacer.nvim",
    },
  },
}
