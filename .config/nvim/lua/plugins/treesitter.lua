---@diagnostic disable: missing-fields
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
          'c',
          'cpp',
          'rust',
          'go',
          'lua',
          'luadoc',
          'printf',
          'vim',
          'vimdoc',
          'markdown',
          'markdown_inline',
          'todotxt',
          'latex',
          'yaml',
          'query',
          'bash',
          'json',
          'toml',
          'make',
          'cmake',
          'diff',
          'dockerfile',
          'git_rebase',
          'gitignore',
          'gitcommit',
          'gitattributes',
          'sql',
        },
        highlight = {
          enable = true,
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
