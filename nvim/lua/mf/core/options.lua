local opt = vim.opt

-- General
--
-- number: Line numbering
-- relativenumber: Line numbering relative to current line
-- wrap: Line wrapping
-- backspace: Improves backspace usage
-- clipboard: Use system clipboard
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")

-- GUI
--
-- termguicolors: Required on true-color terminals
-- cursorline: If true, highlights current line
-- signcolumn: Configures column to left of line numbers
-- showmode: Prevents duplicate mode information when using bufferline plugin
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false

-- Indentation
--
-- tabstop: Number of spaces that a tab represents
-- shiftwidth: Insert X spaces each indentation level
-- expandtab: If true, a tab press inserts spaces instead
-- autoindent: If true, auto indents new line according to level
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Search
--
-- ignorecase: If true, search is case-insensitive
-- smartcase: If true, search is case-sensitive if uppercase letter is present
opt.ignorecase = true
opt.smartcase = true

-- Splits
--
-- splitright: If true, splitting vertically splits right
-- splitbelow: If true, splitting horizontally splits below
opt.splitright = true
opt.splitbelow = true
