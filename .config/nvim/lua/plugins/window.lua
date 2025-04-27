return {
  'yorickpeterse/nvim-window',
  opts = {
    chars = {
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '13',
      '14',
      '15',
      '15',
      '17',
      '18',
      '19',
      '20',
    },
  },
  config = function(_, opts)
    local command = vim.api.nvim_create_user_command
    local window = require 'nvim-window'
    window.setup(opts)
    command('WindowPick', function()
      window.pick()
    end, {})
  end,
}
