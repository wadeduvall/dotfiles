return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  version = false, -- last release is way too old
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    {
      "L3MON4D3/LuaSnip",
      ---@diagnostic disable-next-line: undefined-global
      build = (not jit.os:find("Windows"))
          and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
        or nil,
      dependencies = {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      opts = {
        history = true,
        delete_check_events = "TextChanged",
      },
    },
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },
  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local check_backspace = function()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    local kind_icons = {
      Text = "󰉿",
      Method = "m",
      Function = "󰊕",
      Constructor = "",
      Field = "",
      Variable = "󰆧",
      Class = "󰌗",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰇽",
      Struct = "",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "󰊄",
      Codeium = "󰚩",
      Copilot = "",
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      }),
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = kind_icons[vim_item.kind]
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[nvim]",
            luasnip = "[Snip]",
            buffer = "[Buff]",
            path = "[Path]",
            emoji = "[Emoji]",
          })[entry.source.name]
          return vim_item
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "nvim_lsp_signature_help" },
        {
          name = "luasnip",
          entry_filter = function()
            local context = require("cmp.config.context")
            return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
          end,
        },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = cmp.config.window.bordered({
          border = "single",
          -- Match with noice popup window style
          winhighlight = "Normal:Normal,FloatBorder:DiagnosticInfo",
        }),
        documentation = cmp.config.window.bordered({ border = "single" }),
      },
      experimental = {
        ghost_text = true,
      },
    })
  end,
}