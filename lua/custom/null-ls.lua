local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local opts = {
  sources = {
    -- webdev stuff
    null_ls.builtins.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

    -- Lua
    null_ls.builtins.formatting.stylua,

    -- cpp
    null_ls.builtins.formatting.clang_format,

    -- python
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,

    -- terraform
    null_ls.builtins.formatting.terraform_fmt,

    -- svelte
    null_ls.builtins.formatting.prettier.with { filetypes = { "svelte" } },

    -- go
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.goimports_reviser,

    -- typescript
    null_ls.builtins.formatting.prettier.with {
      filetypes = { "typescript", "typescriptreact" },
    },

    -- ruby
    null_ls.builtins.formatting.rubyfmt.with { filetypes = { "ruby" } },
  },

  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = true }
          print "Formatting Go file..."
        end,
        sources = {
          null_ls.builtins.formatting.goimports,
        },
      })
    end
  end,
}

return opts
