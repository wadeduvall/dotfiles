return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    exclude = {
      filetypes = {
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "man",
        "gitcommit",
        "TelescopePrompt",
        "TelescopeResults",
        "markdown",
        "text",
        "NvimTree",
      },
    },
    scope = { enabled = false },
  },
  main = "ibl",
}
