local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  run = ":TSUpdate",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
    {
      "nvim-tree/nvim-web-devicons",
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
}

-- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
function M.config()
  require("nvim-treesitter")
  local configs = require("nvim-treesitter.configs")

  configs.setup({
    -- A list of parser names, or "all"
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "html",
      "javascript",
      "json",
      "lua",
      "python",
      "rust",
      "typescript",
      "vim",
      "python",
      "toml",
      "rst",
      "ninja",
      "markdown",
      "markdown_inline",
      "yaml",
      "regex",
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },
  })
end

return M
