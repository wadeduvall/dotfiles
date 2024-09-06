local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load lazy
require("lazy").setup("plugins", {
  install = { colorscheme = { require("plugins.colorscheme").name } },
  defaults = { lazy = true },
  ui = { wrap = "true" },
  change_detection = { enabled = true, notify = false },
  debug = false,
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", -- Plugin for editing compressed files.
        "matchit", -- What is it?
        "matchparen", -- Plugin for showing matching parens
        "netrw",
        "netrwPlugin", -- Handles file transfers and remote directory listing across a network
        "netrwSettings", -- Handles file transfers and remote directory listing across a network
        "netrwFileHandlers", -- Handles file transfers and remote directory listing across a network
        "tarPlugin", -- Plugin for browsing tar files
        "tohtml", -- Converting a syntax highlighted file to HTML
        "zipPlugin", -- Handles browsing zipfiles
      },
    },
  },
})

--[[	spec = {
		-- Icons
    -- Telescope
    {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
    -- Linter
    {
      "jose-elias-alvarez/null-ls.nvim",
    },
    -- Tag viewer
    {
			'simrat39/symbols-outline.nvim',
      config = function()
        require('symbols-outline').setup{}
      end
    },
    -- Autopair
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('nvim-autopairs').setup{}
      end
    },
    -- Git labels
    {
      'lewis6991/gitsigns.nvim',
      lazy = true,
      dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require('gitsigns').setup{}
      end
    },
    -- LSP
    {
      'neovim/nvim-lspconfig'
    },
    -- Autocomplete
    {
      'hrsh7th/nvim-cmp',
      -- load cmp on InsertEnter
      event = 'InsertEnter',
      -- these dependencies will only be loaded when cmp loads
      -- dependencies are always lazy-loaded unless specified otherwise
      dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
      },
    },
    -- Neorg
    {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
    },
  },
}
--]]
