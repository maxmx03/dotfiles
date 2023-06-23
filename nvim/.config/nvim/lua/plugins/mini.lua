return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local modules = {
        'animate',
        'bracketed',
        'bufremove',
        'cursorword',
        'move',
        'surround',
        'trailspace',
      }

      for _, module in pairs(modules) do
        if type(module) == 'table' then
          local plugin = string.format('mini.%s', module['name'])

          require(plugin).setup(module['config'])
        else
          local plugin = string.format('mini.%s', module)

          require(plugin).setup {}
        end
      end
    end,
  },
}
