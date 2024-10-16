return {
  {
    'nvchad/ui',
    dependencies = {
      'NvChad/volt',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require 'nvchad'
      local tb = require 'nvchad.tabufline'
      vim.api.nvim_create_user_command('TabuNext', tb.next, { desc = 'next buffer' })
      vim.api.nvim_create_user_command('TabuPrev', tb.prev, { desc = 'prev buffer' })
      vim.api.nvim_create_user_command('TabuClose', function()
        tb.close_buffer()
      end, { desc = 'close buffer' })
      vim.api.nvim_create_user_command(
        'TabuCloseAll',
        tb.closeAllBufs,
        { desc = 'closeAll buffer' }
      )
    end,
  },
  {
    'nvchad/base46',
    lazy = true,
    build = function()
      require('base46').load_all_highlights()
    end,
  },
  {
    'nvchad/minty',
    lazy = true,
    dependencies = {
      'NvChad/volt',
    },
  },
  {
    'nvchad/menu',
    lazy = false,
    dependencies = {
      'NvChad/volt',
    },
    config = function()
      local menu = require 'menu'
      vim.api.nvim_create_user_command('MenuOpen', function()
        menu.open 'default'
      end, { desc = 'open menu' })
      vim.api.nvim_create_user_command('MenuTreeOpen', function()
        vim.cmd.exec '"normal! \\<RightMouse>"'
        local options = vim.bo.ft == 'NvimTree' and 'nvimtree' or 'default'
        menu.open(options, { mouse = true })
      end, { desc = 'open nvim-tree menu' })
    end,
  },
  {
    'nvchad/showkeys',
    lazy = true,
  },
}
