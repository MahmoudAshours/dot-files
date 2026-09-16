return {
  ---------------------------------------------------------------------------
  -- Formatting
  ---------------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require "configs.conform"
    end,
  },

  ---------------------------------------------------------------------------
  -- LSP
  ---------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- NvChad defaults: capabilities, Lua LSP, etc.
      require("nvchad.configs.lspconfig").defaults()

      -- Our custom servers/config
      require "configs.lspconfig"
    end,
  },

  ---------------------------------------------------------------------------
  -- Treesitter
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",

    opts = {
      ensure_installed = {
        ---------------------------------------------------------------------
        -- Neovim / Lua
        ---------------------------------------------------------------------
        "lua",
        "luadoc",
        "vim",
        "vimdoc",

        ---------------------------------------------------------------------
        -- Go
        ---------------------------------------------------------------------
        "go",
        "gomod",
        "gosum",
        "gowork",
        "gotmpl",

        ---------------------------------------------------------------------
        -- Laravel / PHP / Blade
        ---------------------------------------------------------------------
        "php",
        "php_only",
        "phpdoc",
        "blade",

        ---------------------------------------------------------------------
        -- Web
        ---------------------------------------------------------------------
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",

        ---------------------------------------------------------------------
        -- Infrastructure / DevOps
        ---------------------------------------------------------------------
        "bash",
        "dockerfile",
        "nginx",
        "terraform",
        "hcl",
        "yaml",
        "toml",

        ---------------------------------------------------------------------
        -- Config / Data
        ---------------------------------------------------------------------
        "json",
        "jsonc",
        "sql",

        ---------------------------------------------------------------------
        -- Git
        ---------------------------------------------------------------------
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",

        ---------------------------------------------------------------------
        -- Other languages you use
        ---------------------------------------------------------------------
        "java",
        "python",
        "dart",
        "cpp",

        ---------------------------------------------------------------------
        -- Documentation
        ---------------------------------------------------------------------
        "markdown",
        "markdown_inline",

        ---------------------------------------------------------------------
        -- Misc
        ---------------------------------------------------------------------
        "regex",
      },

      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = {
        enable = true,
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Mason
  --
  -- NvChad already ships Mason.
  -- mason-tool-installer gives us a real `ensure_installed`.
  ---------------------------------------------------------------------------
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },

    lazy = false,

    opts = {
      ensure_installed = {
        ---------------------------------------------------------------------
        -- Go
        ---------------------------------------------------------------------
        "gopls",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "delve",

        ---------------------------------------------------------------------
        -- Laravel / PHP / Blade
        ---------------------------------------------------------------------
        "intelephense",
        "blade-formatter",
        "php-cs-fixer",

        ---------------------------------------------------------------------
        -- Web
        ---------------------------------------------------------------------
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "emmet-ls",
        "json-lsp",
        "typescript-language-server",
        "prettier",

        ---------------------------------------------------------------------
        -- Lua
        ---------------------------------------------------------------------
        "lua-language-server",
        "stylua",

        ---------------------------------------------------------------------
        -- Infrastructure
        ---------------------------------------------------------------------
        "bash-language-server",
        "shellcheck",
        "shfmt",
        "dockerfile-language-server",
        "yaml-language-server",
        "terraform-ls",

        ---------------------------------------------------------------------
        -- Java
        ---------------------------------------------------------------------
        "jdtls",

        ---------------------------------------------------------------------
        -- C / C++
        ---------------------------------------------------------------------
        "clangd",
        "clang-format",

        ---------------------------------------------------------------------
        -- Python
        ---------------------------------------------------------------------
        "pyright",
        "ruff",
      },

      -- Install missing tools automatically
      run_on_start = true,

      -- Don't run installation immediately during startup
      start_delay = 3000,

      -- Avoid checking on every single Neovim launch
      debounce_hours = 12,

      integrations = {
        ["mason-lspconfig"] = false,
        ["mason-null-ls"] = false,
        ["mason-nvim-dap"] = false,
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Laravel / Blade
  ---------------------------------------------------------------------------

  -- Blade filetype / syntax support
  {
    "jwalton512/vim-blade",
    ft = { "blade", "php" },
  },

  -- Laravel-aware commands, Telescope integrations, artisan, routes, etc.
  {
    "adalessa/laravel.nvim",

    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },

    cmd = { "Laravel" },

    ft = {
      "php",
      "blade",
    },

    opts = {},
  },

  ---------------------------------------------------------------------------
  -- HTML / JSX / TSX / Blade automatic tag handling
  ---------------------------------------------------------------------------
  {
    "windwp/nvim-ts-autotag",

    ft = {
      "html",
      "blade",
      "javascriptreact",
      "typescriptreact",
    },

    opts = {},
  },

  ---------------------------------------------------------------------------
  -- .env files
  ---------------------------------------------------------------------------
  {
    "tpope/vim-dotenv",

    ft = {
      "sh",
      "zsh",
      "dotenv",
    },
  },

  ---------------------------------------------------------------------------
  -- Diagnostics / problems / symbols
  ---------------------------------------------------------------------------
  {
    "folke/trouble.nvim",

    cmd = {
      "Trouble",
    },

    opts = {},
  },

  ---------------------------------------------------------------------------
  -- Markdown preview
  ---------------------------------------------------------------------------
  {
    "iamcco/markdown-preview.nvim",

    ft = {
      "markdown",
    },

    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },

    build = "cd app && npm install",
  },
}
