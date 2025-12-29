-- Only load GitHub Copilot if not running inside VSCode
if vim.fn.exists("$VSCODE") == 0 then
  return {
    "github/copilot.vim",
  }
else
  return {}
end
