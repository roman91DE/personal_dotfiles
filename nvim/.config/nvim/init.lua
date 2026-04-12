-- ============================================================================
-- NEOVIM CONFIGURATION
-- ============================================================================
-- Sources shared settings for Vim and Neovim

-- Load shared settings from Vim configuration
local settings_file = os.getenv("HOME") .. "/.vimrc"
if vim.fn.filereadable(settings_file) == 1 then
  vim.cmd("source " .. settings_file)
end

-- Compatibility shim: neovim 0.12 removed vim.uri as a loadable module but
-- vscode-neovim's LSP code still requires it. Only apply inside VS Code.
if vim.g.vscode then
  if not pcall(require, "vim.uri") then
    package.preload["vim.uri"] = function()
      return {
        uri_to_fname  = vim.uri_to_fname,
        uri_from_fname = vim.uri_from_fname,
        uri_to_bufnr  = vim.uri_to_bufnr,
        uri_from_bufnr = vim.uri_from_bufnr,
      }
    end
  end
end

