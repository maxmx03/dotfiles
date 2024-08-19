---@diagnostic disable: missing-fields
return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local code = require('code')
      require('nvim-treesitter.configs').setup {
        auto_install = true,
        sync_install = false,
        ensure_installed = code.langs,
        ignore_install = { 'dashboard' },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
}
