return {
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'python' },
    lazy = true,
    init = function()
      -- Set configuration options here
      -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
      -- This is VERY helpful when reporting an issue with the project
      vim.g['conjure#debug'] = true
      vim.g['conjure#filetype#fennel'] = 'conjure.client.fennel.stdio'
      vim.g['conjure#log#hud#enabled'] = false
    end,
    dependencies = { 'PaterJason/cmp-conjure' },
  },
  {
    'PaterJason/cmp-conjure',
    lazy = true,
    config = function()
      local cmp = require 'cmp'
      local config = cmp.get_config()
      table.insert(config.sources, { name = 'conjure' })
      cmp.setup(config)
    end,
  },
}
