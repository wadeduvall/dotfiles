return {
  "nvim-neorg/neorg",
  event = "VeryLazy",
  version = "*",
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      priority = 1000,
      config = true,
    },
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
          },
        }, -- Adds pretty icons to your documents
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    })
  end,
}
