return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local lualine = require 'lualine'

      lualine.setup {
        options = {
          theme = 'retrowave',
          disabled_filetypes = {
            'NvimTree',
            'starter',
          },
        },
      }
    end,
  },
}
