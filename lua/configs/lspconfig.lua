local nvchad_lsp = require "nvchad.configs.lspconfig"

nvchad_lsp.defaults()

-- Go
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,

      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        shadow = true,
        useany = true,
      },

      hints = {
        assignVariableTypes = false,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

-- Python
vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

vim.lsp.enable {
  -- primary
  "gopls",
  "jdtls",

  -- infra
  "bashls",
  "dockerls",
  "yamlls",
  "jsonls",
  "terraformls",

  -- occasional work
  "pyright",
  "ts_ls",
  "html",
  "cssls",
  "clangd",
  "intelephense",
}
