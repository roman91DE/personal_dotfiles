-- ============================================================================
-- NEOVIM CONFIGURATION
-- ============================================================================
-- Sources shared settings for Vim and Neovim

-- Load shared settings from Vim configuration
local settings_file = os.getenv("HOME") .. "/.vim/settings.vim"
if vim.fn.filereadable(settings_file) == 1 then
  vim.cmd("source " .. settings_file)
end

-- If we arent running inside VSCode, we want to use Lazy.nvim as our Plugin-Manager
if not vim.g.vscode then
    require("config.lazy")
end

