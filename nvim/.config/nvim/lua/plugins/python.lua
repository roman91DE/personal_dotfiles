-- Python Development Setup for LazyVim
-- Includes: LSP (Pyright), Formatting (Black, Ruff), Linting, Debugging, and Testing

return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    },
  },

  -- Treesitter for Python syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "python",
      })
    end,
  },

  -- Linting with Ruff
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        python = { "ruff" },
      },
      linters = {
        ruff = {
          args = { "check", "--output-format=json" },
        },
      },
    },
  },

  -- Debugging with DAP
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      config = function()
        local dap_python = require("dap-python")
        dap_python.setup("python")
        dap_python.test_runner = "pytest"
      end,
    },
  },

  -- Testing with pytest
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          dap = { justMyCode = false },
          args = { "-vv" },
          runner = "pytest",
        },
      },
    },
  },

  -- Mason tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "black",
        "ruff",
        "debugpy",
        "pytest",
      },
    },
  },
}
