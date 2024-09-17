return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        auto_install = true,
        sync_install = false,
        ensure_installed = 'all',
        ignore_install = { 'dashboard' },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  {
    'luckasRanarison/tree-sitter-hyprlang',
    config = function()
      vim.filetype.add {
        pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
      }
    end,
  },
  {
    'davidmh/mdx.nvim',
    config = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
