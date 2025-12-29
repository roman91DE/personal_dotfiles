return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "n",
      noremap = true,
      silent = true,
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "ruff_fix", "black", "ruff_format" },
    },
    formatters = {
      ruff_fix = {
        command = "ruff",
        args = { "check", "--fix", "--output-format=json", "-" },
        stdin = true,
      },
      black = {
        prepend_args = { "--line-length=100" },
      },
      ruff_format = {
        args = { "format", "--line-length=100", "-" },
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
