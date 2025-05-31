return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local neovim_version = function()
        local version = vim.version()

        if vim.g.neovide then
          return string.format(
            'Neovim v%s.%s.%s Neovide v%s',
            version.major,
            version.minor,
            version.patch,
            vim.g.neovide_version
          )
        end

        return string.format('Version: v%s.%s.%s', version.major, version.minor, version.patch)
      end
      local plugins = function()
        local stats = require('lazy').stats()
        return '  Loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins'
      end
      local header = function()
        local val = require('include.ascii')[math.random(2)]
        local emmptyLine = string.rep(' ', vim.fn.strwidth(val[1]))
        table.insert(val, 1, emmptyLine)
        table.insert(val, 2, emmptyLine)
        val[#val + 1] = emmptyLine
        val[#val + 1] = emmptyLine
        return val
      end

      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = header(),
          center = {
            {
              icon = '󰨭 ',
              desc = 'Projects',
              key = 'p',
              -- keymap = 'SPC s f',
              action = 'Telescope session-lens',
            },
            {
              icon = ' ',
              desc = 'Find Files',
              key = 'f',
              keymap = 'SPC t f',
              action = 'Telescope find_files',
            },
            {
              icon = ' ',
              desc = 'File explorer',
              key = 'n',
              keymap = '<c-x><c-d>',
              action = ':Dired',
            },
            {
              icon = ' ',
              desc = 'Configuration',
              key = 'c',
              -- keymap = 'SPC c',
              action = 'lua vim.cmd(string.format("edit %s", vim.fn.stdpath("config")))',
            },
            {
              icon = '󰩈 ',
              desc = 'Quit',
              key = 'q',
              keymap = 'SPC q',
              action = 'quit',
            },
          },
          footer = { neovim_version(), plugins() },
        },
      }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
