-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd
-- Create/get autocommand group
local augroup = vim.api.nvim_create_augroup

local function open_nvim_tree(data)
  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not real_file and not no_name then
    return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
end

-- Open nvim-tree automatically
-- autocmd("VimEnter", {
--   callback = open_nvim_tree,
-- })
-- Close nvim-tree on on :q
autocmd("QuitPre", {
  command = "NvimTreeClose",
})

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "1000" })
  end,
})

-- Disable line length marker
autocmd("Filetype", {
  pattern = { "text", "markdown", "html", "xhtml", "javascript", "typescript" },
  command = "setlocal cc=0",
})
-- .tpp files are cpp
autocmd("Filetype", {
  pattern = { "tpp" },
  command = "set filetype=cpp",
})
-- Set indentation to 2 spaces
autocmd("Filetype", {
  pattern = {
    "xml",
    "html",
    "xhtml",
    "css",
    "scss",
    "javascript",
    "typescript",
    "yaml",
    "lua",
    "json",
    "javascriptreact",
  },
  command = "setlocal shiftwidth=2 tabstop=2",
})

-- Open a Terminal on the right tab
autocmd("CmdlineEnter", {
  command = "command! Term :botright vsplit term://$SHELL",
})

-- Enter insert mode when switching to terminal
autocmd("TermOpen", {
  command = "setlocal listchars= nonumber norelativenumber nocursorline",
})

autocmd("TermOpen", {
  pattern = "",
  command = "startinsert",
})

-- Close terminal buffer on process exit
autocmd("BufLeave", {
  pattern = "term://*",
  command = "stopinsert",
})

-- Treesitter automatic Python format strings
vim.api.nvim_create_augroup("py-fstring", { clear = true })
vim.api.nvim_create_autocmd("InsertCharPre", {
  pattern = { "*.py" },
  group = "py-fstring",
  --- @diagnostic disable-next-line: undefined-doc-name
  --- @param opts AutoCmdCallbackOpts
  --- @return nil
  callback = function(opts)
    -- Only run if f-string escape character is typed
    if vim.v.char ~= "{" then
      return
    end

    -- Get node and return early if not in a string
    local node = vim.treesitter.get_node()

    if not node then
      return
    end
    if node:type() ~= "string" then
      node = node:parent()
    end
    if not node or node:type() ~= "string" then
      return
    end

    vim.print(node:type())
    local row, col, _, _ = vim.treesitter.get_node_range(node)

    -- Return early if string is already a format string
    --- @diagnostic disable-next-line: undefined-field
    local first_char = vim.api.nvim_buf_get_text(opts.buf, row, col, row, col + 1, {})[1]
    vim.print("row " .. row .. " col " .. col)
    vim.print("char: '" .. first_char .. "'")
    if first_char == "f" then
      return
    end

    -- Otherwise, make the string a format string
    vim.api.nvim_input("<Esc>m'" .. row + 1 .. "gg" .. col + 1 .. "|if<Esc>`'la")
  end,
})

-- Fix neorg concealer
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.norg" },
  command = "set conceallevel=3",
})
