local M = {}

M.servers = {
	"lua_ls",
	"cssls",
	"html",
	"ts_ls",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"clangd",
	"taplo",
	"marksman",
	"cmake",
	"rust_analyzer",
	-- "ruff_lsp",
	-- "ltex",
}

M.linters = {
	"clang-format",
	"flake8",
	"prettier",
	"stylua",
	"black",
	"isort",
	"shfmt",
	-- "codespell",
	-- "vale",
}

M.daps = {
	"python",
	"codelldb",
	"js",
}

return M
