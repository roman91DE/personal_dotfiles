return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local on_attach = function(_, bufnr)
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
      end
      map("gh", vim.lsp.buf.hover, "LSP hover docs")
      map("gd", vim.lsp.buf.definition, "LSP go to definition")
      map("gl", vim.lsp.buf.references, "LSP list references")
      map("gr", vim.lsp.buf.rename, "LSP rename symbol")
      map("ga", vim.lsp.buf.code_action, "LSP code actions")
      map("gf", vim.diagnostic.open_float, "LSP diagnostics float")
      map("gp", vim.diagnostic.goto_prev, "LSP previous diagnostic")
      map("gn", vim.diagnostic.goto_next, "LSP next diagnostic")
    end

    vim.lsp.config("pyright", {
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            autoImportCompletions = true,
            typeCheckingMode = "basic",
          },
        },
        },
        })
    
    -- Enable Pyright (will attach on matching filetypes)
    vim.lsp.enable("pyright")

    -- Basic Ruff LSP setup
    vim.lsp.config("ruff", {
      on_attach = on_attach,
      settings = {
        -- Use default configuration from project's pyproject.toml or ruff.toml
      }
    })

    -- Enable Ruff (will attach on matching filetypes)
    vim.lsp.enable("ruff")
  end,
}