return {
  {
    {
      'nvim-neorg/neorg',
      build = ':Neorg sync-parsers',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('neorg').setup {
          load = {
            ['core.defaults'] = {}, -- Loads default behaviour
            ['core.concealer'] = {}, -- Adds pretty icons to your documents
            ['core.dirman'] = {
              config = {
                workspaces = {
                  notes = '~/.config/notes',
                },
              },
            },
          },
        }
      end,
    },
  },
}
