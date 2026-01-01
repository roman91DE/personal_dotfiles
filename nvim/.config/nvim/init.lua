-- ============================================================================
-- NEOVIM CONFIGURATION
-- ============================================================================
-- Sources shared settings for Vim and Neovim

-- Load shared settings from Vim configuration
local settings_file = os.getenv("HOME") .. "/.vim/settings.vim"
if vim.fn.filereadable(settings_file) == 1 then
  vim.cmd("source " .. settings_file)
end

