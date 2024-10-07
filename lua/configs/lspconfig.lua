-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.jdtls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig["dartls"].setup {
  on_attach = on_attach,
  settings = {
    dart = {
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/.pub-cache/"),
        vim.fn.expand("/opt/homebrew/"),
        vim.fn.expand("$HOME/Dev/flutter/"),
      }
    }
  }
}
lspconfig["yamlls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig["gopls"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
lspconfig["clangd"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
