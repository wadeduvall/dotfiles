local M = {
  "folke/neodev.nvim",
  event = "VimEnter",
  depends = {
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
  },
}

function M.config()
  local status_ok, _ = pcall(vim.cmd.neodev, M.name)
  if not status_ok then
    return
  end

  require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
  })
end

return M
