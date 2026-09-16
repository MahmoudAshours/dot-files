require "nvchad.options"

local o = vim.opt

-- Navigation
o.number = true
o.relativenumber = true
o.cursorline = true
o.scrolloff = 8
o.sidescrolloff = 8

-- Editing
o.wrap = false
o.signcolumn = "yes"
o.undofile = true

-- Search
o.ignorecase = true
o.smartcase = true

-- Splits
o.splitright = true
o.splitbelow = true

-- Responsiveness
o.updatetime = 200
o.timeoutlen = 300

-- Show invisible whitespace
o.list = true
o.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

-- Neovim 0.11 floating windows
o.winborder = "rounded"

-- Ask before losing modified buffers
o.confirm = true
