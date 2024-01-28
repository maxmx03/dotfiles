return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local doom = {
        '                                                                              ',
        '=================     ===============     ===============   ========  ========',
        '\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //',
        '||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||',
        '|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||',
        '||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||',
        '|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||',
        "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
        '|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||',
        "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
        "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
        "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
        "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
        "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
        "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
        "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
        "||.=='    _-'                                                     `' |  /==.||",
        "=='    _-'                        N E O V I M                         \\/   `==",
        "\\   _-'                                                                `-_   /",
        " `''                                                                      ``'  ",
      }

      local hydra = {
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣄⣀⡀⢿⣄⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⣾⣿⣷⣶⡾⣿⣦⣤⣤⡾⠀⠀⠀⠀⠀⠀⠀⣠⣶⣶⣿⣿⣿⣿⣷⣼⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠉⠉⠻⣿⣿⣿⣿⣿⣿⣶⣦⣄⡀⠀⠀⣴⣿⣿⣿⣿⠿⠛⠛⠿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠈⠿⠟⠉⠙⠿⣿⣿⣷⣤⠀⠚⠁⣿⣿⣿⣿⠀⠀⠀⠀⠀⣿⣿⣿⣽⣧⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣯⠻⡀⢸⣿⣿⣿⣿⡀⠀⠀⠀⠀⠻⠿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⠸⣿⣿⣿⣿⣿⣄⠀⠀⠘⣄⠀⠀⠀⠙⣿⣿⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⢹⠀⠀⢻⠈⢿⣿⣿⣿⣿⣷⣶⣬⣿⣷⣶⣦⡀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⢤⡀⠀⠀⠀⡀⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀⠠⠚⠋⣹⣿⣿⣿⣿⣿⣿⣿⣿⣷⣮⣿⣶⣤⣤⠀⠀⠀',
        '⠀⠀⠀⠀⣿⣴⣿⣥⣄⡀⠀⢰⣿⣿⣿⡿⠀⠀⠀⢀⣾⣿⣿⣿⡿⣿⣿⣿⣷⠀⣿⣿⣿⣿⠿⣿⣿⡆⠀⠀',
        '⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⡂⢸⣿⣿⡏⠀⠀⠀⢠⢟⣿⣿⣿⠁⠀⠈⣿⣿⣿⡄⠀⠁⠀⠀⠀⣤⠈⠀⠀⠀',
        '⠀⠀⣿⣹⣿⡏⠀⠹⣿⣿⣟⠜⣿⣿⣿⠀⠀⠀⠀⣿⣿⣿⣧⠀⠀⠀⣿⣿⣿⡇⠀⢀⣬⣿⣦⣿⡀⠀⠀⠀',
        '⠀⢀⣿⣿⠿⠃⠀⢀⣿⣿⣿⠀⢿⣿⣿⣧⠀⠀⠀⣿⣿⣿⣿⣦⠀⠀⣿⣿⣿⡇⢚⣿⣿⣿⣿⣿⣿⣦⠀⠀',
        '⠀⣿⡿⠀⠀⠀⠀⣾⣿⣿⢹⠀⠀⢿⣿⣿⣷⣄⠀⢿⠹⣿⣿⣿⣷⣾⣿⣿⣿⠀⣿⣿⣿⠀⠀⣿⣿⣿⡀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠁⠀⠀⠀⠙⣿⣿⣿⣿⣶⣄⢹⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣄⠀⠀⠈⠻⣿⠂',
        '⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣦⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠹⢻⣿⣿⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣷⣶⣤⣤⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⣸⣿⣿⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣶⣶⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⣠⣶⣦⡀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡤⠀⠀⠀⠀⢀⣀⠀',
        '⣠⠀⣠⣤⣀⣩⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣻⣒⣿',
        '⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉',
      }
      local version = vim.version()
      local neovim_version =
        string.format('Version: v%s.%s.%s', version.major, version.minor, version.patch)
      local lazy = require 'lazy'
      local plugins = string.format('Plugins: %s installed', lazy.stats().count)
      local headers = { doom, hydra }
      math.randomseed(os.time())
      local header = headers[math.random(#headers)]

      local emmptyLine = string.rep(' ', vim.fn.strwidth(header[1]))
      table.insert(header, 1, emmptyLine)
      table.insert(header, 2, emmptyLine)
      header[#header + 1] = emmptyLine
      header[#header + 1] = emmptyLine
      local icons = require 'core.icons'

      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = header,
          center = {
            {
              icon = icons.ui.Project .. ' ',
              desc = 'Projects',
              key = 'p',
              keymap = 'SPC s p',
              action = 'Telescope projects',
            },
            {
              icon = icons.ui.FindFile .. ' ',
              desc = 'Files',
              key = 'f',
              keymap = 'SPC s f',
              action = 'Telescope find_files',
            },
            {
              icon = icons.ui.Folder .. ' ',
              desc = 'File explorer',
              key = 'n',
              keymap = 'SPC e',
              action = 'NvimTreeOpen',
            },
            {
              icon = icons.ui.Package .. ' ',
              desc = 'Plugins',
              key = 'l',
              keymap = 'SPC p p',
              action = 'Lazy',
            },
            {
              icon = icons.ui.Package .. ' ',
              desc = 'Packages',
              key = 'm',
              keymap = 'SPC M',
              action = 'Mason',
            },
            {
              icon = icons.ui.Gear .. ' ',
              desc = 'Configuration',
              key = 'c',
              keymap = 'SPC c',
              action = 'lua vim.cmd(string.format("edit %s/init.lua", vim.fn.stdpath("config")))',
            },
            {
              icon = icons.ui.Close .. ' ',
              desc = 'Quit',
              key = 'q',
              keymap = 'SPC q',
              action = 'quit',
            },
          },
          footer = { neovim_version, plugins },
        },
      }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
