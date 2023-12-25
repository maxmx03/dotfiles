return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local modules = {
        'bracketed',
        'bufremove',
        'cursorword',
        'indentscope',
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
