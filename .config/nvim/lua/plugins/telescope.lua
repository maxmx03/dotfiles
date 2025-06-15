---@diagnostic disable: undefined-field
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      prompt_prefix = '   ',
      selection_caret = ' ',
      entry_prefix = ' ',
      sorting_strategy = 'ascending',
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.80,
      },
    },
  },
  config = function(_, opts)
    local telescope = require 'telescope'
    telescope.setup(opts)
    telescope.load_extension 'projects'
    telescope.load_extension 'themes'
  end,
}
