local opt = vim.opt

-- General
--
-- 1: Disable line wrapping
-- 2: Enable clipaboard usage
-- 3: Enable cursor line
opt.wrap = false
opt.clipboard:append("unnamedplus")
opt.cursorline = true

-- Number line
--
-- 1: Display numbers relative to cursor
-- 2: Display current line number
-- 3: Enable sign column
opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes"

-- Appearance
--
-- 1: Line numbers color
-- 2: Cursor line color
-- 3: Current line number color
-- 4: Autocomplete menu background color
-- 5: Autocomplete extra menu background color
vim.api.nvim_set_hl(0, "LineNr", { ctermfg = "yellow" })
vim.api.nvim_set_hl(0, "CursorLineNr", { ctermfg = "magenta" })
vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = "darkgray" })
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg = "magenta" })
vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = "magenta" })

-- Color column
--
-- 1: Set color column to red
-- 2-7: Enable color column just for C/C++ files
-- vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = "red" })
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "c", "cpp", "h", "hpp", "cc" },
-- 	callback = function()
-- 		vim.opt_local.colorcolumn = "80"
-- 	end,
-- })

-- Tabs & indentation
--
-- 1: How many spaces a tab is equal to
-- 2: How many spaces each level is equal to
-- 3: Tabs will be converted to spaces
-- 4: Copy indentation from currently line after opening
-- 5: Setup backspace to work as expected
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.backspace = "indent,eol,start"

-- Search
--
-- 1: Enable case-insensitive searching
-- 2: Case-sensitive search if uppercase char is inserted
opt.ignorecase = true
opt.smartcase = true

-- Splitting
--
-- 1: Split eastward when splitting vertically
-- 2: Split southward when splitting horizontally
opt.splitright = true
opt.splitbelow = true
