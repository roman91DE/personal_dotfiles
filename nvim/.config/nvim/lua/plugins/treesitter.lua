-- return {
--   "nvim-treesitter/nvim-treesitter",
--   lazy = false,
--   highlight = true ,
--   build = ":TSUpdate",
--   additional_vim_regex_highlighting = true,
--   config = function()
--     require("nvim-treesitter").setup({})
    
--     -- Install parsers
--     require("nvim-treesitter").install({
--       "python",
--     })
    
--     -- Enable highlighting for all filetypes
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "py",
--       callback = function()
--         vim.treesitter.start()
--       end,
--     })
--   end,
-- }

return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'go', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'python', 'query', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    }
}