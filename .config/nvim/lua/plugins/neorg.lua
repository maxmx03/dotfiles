return {
  {
    {
      'nvim-neorg/neorg',
      build = ':Neorg sync-parsers',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('neorg').setup {
          load = {
            ["core.integrations.treesitter"] = {},
            ["core.export"] = {},
            ['core.export.markdown'] = {
              config = {
                extension = "md",
                extensions = "all",
              }
            },
            ['core.defaults'] = {},  -- Loads default behaviour
            ['core.concealer'] = {}, -- Adds pretty icons to your documents
            ['core.dirman'] = {
              config = {
                workspaces = {
                  notes = vim.fn.stdpath 'cache' .. '/notes'
                },
              },
            },
          },
        }
      end,
    },
  },
}
