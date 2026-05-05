-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- macOS: re-sign tree-sitter parsers after install/update (macOS 26+ kills unsigned .so files)
vim.api.nvim_create_autocmd("User", {
  group = augroup("treesitter_codesign"),
  pattern = { "TSInstall", "TSUpdate" },
  callback = function()
    local parser_dir = vim.fn.stdpath("data") .. "/site/parser"
    vim.fn.jobstart(
      string.format("find %s -name '*.so' | xargs codesign --sign - --force 2>/dev/null", parser_dir),
      { detach = true }
    )
  end,
})

-- In text-like files, use spell checking for germand and english
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en", "de" } -- or "en_us,de_de"
  end,
})
