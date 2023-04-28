return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local modules = {
        'ai',
        'align',
        -- 'animate',
        'bracketed',
        'bufremove',
        'cursorword',
        'indentscope',
        'map',
        'move',
        {
          name = 'starter',
          config = require 'core.mini.starter',
        },
        'surround',
        'tabline',
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

      vim.cmd.autocmd 'Filetype NvimTree lua vim.b.miniindentscope_disable = true'
    end,
  },
}
