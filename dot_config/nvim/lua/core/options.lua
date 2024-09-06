local opt = vim.opt -- Options

-- General Settings
opt.mouse = "a" -- Enable mouse
opt.clipboard = "unnamedplus" -- Use X11 clipboard for + register
opt.swapfile = false -- disable creating swap file
-- Autocomplete options
opt.completeopt = "menuone,noselect"
opt.conceallevel = 0 -- So that `` is visible in markdown files
opt.undofile = true -- Enable persistent undo

-- UI
opt.cursorline = true -- Highlight current line
opt.cmdheight = 1 -- More space in the command line for displaying messages
opt.number = true -- Show line numbers
opt.relativenumber = true -- Make line numbers relative
opt.showmatch = true -- Highlight matching pairs
opt.matchpairs:append({ "<:>" }) -- Make < and > match
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
opt.foldlevel = 99 -- Unfold by default
opt.colorcolumn = "80" -- Show a line to indicate the line width
opt.splitright = true -- cause split windows to go right by default
opt.splitbelow = true -- cause split downs to go below by default
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- 24-bit RGB colors
--opt.shortmess:append "sI"           -- Disable welcome message
opt.laststatus = 3 -- Set global statusline
opt.signcolumn = "yes" -- Always show the sign column
--opt.wrap = false                    -- Display lines as one long line
opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
opt.showtabline = 0 -- Always show tabs

-- Indentation/Tabs
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true -- Smart indentation based on typed code

-- CPU/Memory
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
-- Disable for noice
-- opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

-- Editing
opt.insertmode = false -- Don't stay in insert mode
opt.spell = true -- Enable spell checking
-- Automatic formatting; auto-wrap text, comments; automatically insert current
-- comment leader when hitting enter in insert mode allow formatting of
-- comments with gq; recognize lists
opt.formatoptions:append({ "tcrqn" })
