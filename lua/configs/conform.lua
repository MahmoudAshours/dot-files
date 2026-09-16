return {
  formatters_by_ft = {
    lua = { "stylua" },

    go = {
      "goimports",
      "gofumpt",
    },

    python = {
      "ruff_format",
    },

    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },

    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },

    php = { "php_cs_fixer" },
  },

  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
}
