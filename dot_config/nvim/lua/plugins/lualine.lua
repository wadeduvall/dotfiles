return {
  "nvim-lualine/lualine.nvim",
  event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  opts = function()
    local clients_lsp = function()
      local bufnr = vim.api.nvim_get_current_buf()

      local clients = vim.lsp.buf_get_clients(bufnr)
      if next(clients) == nil then
        return ""
      end

      local c = {}
      for _, client in pairs(clients) do
        table.insert(c, client.name)
      end
      return "  " .. table.concat(c, " | ")
    end

    return {
      options = {
        theme = "onedark",
        component_separators = "|",
        -- section_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "█", right = "" } },
        },
        lualine_b = {
          { "filetype", separator = { left = "" } },
          "filename",
          {
            "branch",
            icon = "",
          },
        },
        lualine_c = {
          {
            "diff",
            -- symbols = { added = " ", modified = " ", removed = " " },
            symbols = { added = " ", modified = " ", removed = " " },
            colored = false,
          },
        },
        lualine_x = {},
        lualine_y = { clients_lsp },
        lualine_z = {
          { "location", separator = { left = "", right = "█" }, icon = "" },
          { "progress", separator = { right = "█" } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "toggleterm", "trouble", "lazy", "nvim-tree" },
    }
  end,
}
