return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        auto_install = true,
        ensure_installed = {
          'lua',
          'luadoc',
          'printf',
          'vim',
          'vimdoc',
          'markdown',
          'todotxt',
          'latex',
          'yaml',
          'typst',
          'html',
        },
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = { enable = true },
      }
    end,
  },
  {
    'davidmh/mdx.nvim',
    config = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
