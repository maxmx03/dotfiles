return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = false,
      },
      filters = {
        dotfiles = false,
      },
    }

    vim.api.nvim_create_user_command('ToggleFileExplorer', function()
      local api = require 'nvim-tree.api'
      api.tree.toggle { open = true, focus = true, find_file = true }
    end, {})
  end,
}
