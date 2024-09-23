return {
  {
    dir = vim.fn.stdpath 'config' .. '/lua/github',
    lazy = false,
    priority = 1000,
    ---@type github.config
    opts = {
      transparent = {
        enabled = true,
        lazy = false,
        mason = false,
        neotree = false,
      },
      on_highlights = function(colors)
        ---@type github.groups
        return {
          ColorColumn = { bg = colors.base03 },
        }
      end,
    },
    config = function(_, opts)
      -- require('github').setup(opts)
      -- vim.cmd.colorscheme 'github'
    end,
  },
  {
    dir = vim.fn.stdpath 'config' .. '/lua/horizon',
    lazy = false,
    priority = 1000,
    ---@type horizon.config
    opts = {
      transparent = {
        enabled = true,
        lazy = false,
        mason = false,
        neotree = false,
      },
      on_highlights = function(colors)
        ---@type horizon.groups
        return {
          ColorColumn = { bg = colors.base03 },
        }
      end,
    },
    config = function(_, opts)
      require('horizon').setup(opts)
      vim.cmd.colorscheme 'horizon'
    end,
  },
  -- {
  --   'maxmx03/solarized.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = {
  --       enabled = false,
  --       lazy = false,
  --       mason = false,
  --       neotree = false,
  --       normal = true,
  --     },
  --   },
  --   config = function(_, opts)
  --     require('solarized').setup(opts)
  --     vim.cmd.colorscheme 'solarized'
  --   end,
  -- },
}
