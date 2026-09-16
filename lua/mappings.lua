require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "Command mode" })
map("i", "jk", "<ESC>")

-- Save
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save" })

-- Clear search highlighting
map("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear search highlight" })

-- Diagnostics
map("n", "<leader>xx", function()
  require("trouble").toggle("diagnostics")
end, { desc = "Workspace diagnostics" })

map("n", "<leader>xX", function()
  require("trouble").toggle {
    mode = "diagnostics",
    filter = { buf = 0 },
  }
end, { desc = "Buffer diagnostics" })

map("n", "<leader>cs", function()
  require("trouble").toggle {
    mode = "symbols",
    focus = false,
  }
end, { desc = "Document symbols" })

-- Formatting
map({ "n", "v" }, "<leader>fm", function()
  require("conform").format {
    lsp_format = "fallback",
  }
end, { desc = "Format" })

-- Quick Go test
map("n", "<leader>gt", function()
  vim.cmd "split | terminal go test ./..."
end, { desc = "Go test ./..." })

-- Toggle wrapping when looking at logs
map("n", "<leader>uw", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle wrap" })
