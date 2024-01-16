return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'markdown', 'markdown_inline', 'lua', 'regex', 'vim', 'norg' },
        auto_install = true,
        sync_install = false,
        ignore_install = {},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  {
    'luckasRanarison/tree-sitter-hyprlang',
  },
}
