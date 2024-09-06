local M = {
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
    },
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "jose-elias-alvarez/null-ls.nvim",
      },
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
    },
  },
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

function M.config()
  require("mason").setup(settings)
  require("mason-lspconfig").setup({
    ensure_installed = require("utils").servers,
  })
  require("mason-null-ls").setup({
    ensure_installed = require("utils").linters,
  })
  require("mason-nvim-dap").setup({
    ensure_installed = require("utils").daps,
  })
end

return M
