local options = {
  base46 = {
    theme = 'horizon',
    hl_add = {},
    hl_override = {
      SpellBad = { link = '@text.strike' },
      LspInlayHint = { link = 'Comment' },
    },
    integrations = {},
    changed_themes = {},
    transparency = false,
    theme_toggle = { 'horizon', 'oxocarbon' },
  },

  ui = {
    cmp = {
      icons_left = true, -- only for non-atom styles!
      lspkind_text = true,
      style = 'default', -- default/flat_light/flat_dark/atom/atom_colored
      format_colors = {
        tailwind = true, -- will work for css lsp too
        icon = '󱓻',
      },
    },

    telescope = { style = 'borderless' }, -- borderless / bordered

    statusline = {
      enabled = true,
      theme = 'default', -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = 'default',
      order = nil,
      modules = nil,
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
      enabled = true,
      lazyload = false,
      order = { 'treeOffset', 'buffers', 'tabs', 'btns' },
      modules = nil,
    },
  },

  nvdash = {
    load_on_startup = true,
    header = {
      '                            ',
      '     ▄▄         ▄ ▄▄▄▄▄▄▄   ',
      '   ▄▀███▄     ▄██ █████▀    ',
      '   ██▄▀███▄   ███           ',
      '   ███  ▀███▄ ███           ',
      '   ███    ▀██ ███           ',
      '   ███      ▀ ███           ',
      '   ▀██ █████▄▀█▀▄██████▄    ',
      '     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ',
      '                            ',
      '     Powered By  eovim    ',
      '                            ',
    },

    buttons = {
      { txt = '  Find File', keys = 'Spc f', cmd = 'Telescope find_files' },
      { txt = '  Recent Files', keys = 'Spc f o', cmd = 'Telescope oldfiles' },
      { txt = '󰈭  Find Word', keys = 'Spc f w', cmd = 'Telescope live_grep' },
      { txt = '󱥚  Themes', keys = 'Spc t h', cmd = ":lua require('nvchad.themes').open()" },
      { txt = '  Mappings', keys = 'Spc c h', cmd = 'NvCheatsheet' },
      { txt = ' Projects', keys = 'Spc s p', cmd = 'Telescope projects' },
      { txt = ' Config', keys = 'Spc s p', cmd = 'lua vim.cmd(string.format("edit %s/init.lua", vim.fn.stdpath("config")))' },
      { txt = '─', hl = 'NvDashLazy', no_gap = true, rep = true },

      {
        txt = function()
          local stats = require('lazy').stats()
          local ms = math.floor(stats.startuptime) .. ' ms'
          return '  Loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms
        end,
        hl = 'NvDashLazy',
        no_gap = true,
      },

      { txt = '─', hl = 'NvDashLazy', no_gap = true, rep = true },
    },
  },

  term = {
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ['bo sp'] = 0.3, ['bo vsp'] = 0.2 },
    float = {
      relative = 'editor',
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = 'single',
    },
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = 'grid', -- simple/grid
    excluded_groups = { 'terminal (t)', 'autopairs', 'Nvim', 'Opens' }, -- can add group name or with mode
  },

  mason = { pkgs = {} },

  colorify = {
    enabled = true,
    mode = 'virtual', -- fg, bg, virtual
    virt_text = '󱓻 ',
    highlight = { hex = true, lspvars = true },
  },
}

local status, chadrc = pcall(require, 'chadrc')
return vim.tbl_deep_extend('force', options, status and chadrc or {})
