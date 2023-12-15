return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require 'telescope'

      telescope.load_extension 'projects'

      telescope.setup {
        defaults = {
          prompt_prefix = '󰭎 ',
          selection_caret = '  ',
        },
      }
    end,
  },
}
