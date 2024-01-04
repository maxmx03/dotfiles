return {
  {
    'SmiteshP/nvim-navic',
    config = function()
      local navic = require 'nvim-navic'
      local breadcrumbs = require 'core.navic.breadcrumbs'
      local icons = require 'core.navic.icons'

      breadcrumbs.create_winbar()

      navic.setup {
        highlight = true,
        separator = ' ' .. icons.ui.ChevronRight .. ' ',
        depth_limit = 0,
        depth_limit_indicator = '..',
        icons = {
          Array = icons.kind.Array .. ' ',
          Boolean = icons.kind.Boolean .. ' ',
          Class = icons.kind.Class .. ' ',
          Color = icons.kind.Color .. ' ',
          Constant = icons.kind.Constant .. ' ',
          Constructor = icons.kind.Constructor .. ' ',
          Enum = icons.kind.Enum .. ' ',
          EnumMember = icons.kind.EnumMember .. ' ',
          Event = icons.kind.Event .. ' ',
          Field = icons.kind.Field .. ' ',
          File = icons.kind.File .. ' ',
          Folder = icons.kind.Folder .. ' ',
          Function = icons.kind.Function .. ' ',
          Interface = icons.kind.Interface .. ' ',
          Key = icons.kind.Key .. ' ',
          Keyword = icons.kind.Keyword .. ' ',
          Method = icons.kind.Method .. ' ',
          Module = icons.kind.Module .. ' ',
          Namespace = icons.kind.Namespace .. ' ',
          Null = icons.kind.Null .. ' ',
          Number = icons.kind.Number .. ' ',
          Object = icons.kind.Object .. ' ',
          Operator = icons.kind.Operator .. ' ',
          Package = icons.kind.Package .. ' ',
          Property = icons.kind.Property .. ' ',
          Reference = icons.kind.Reference .. ' ',
          Snippet = icons.kind.Snippet .. ' ',
          String = icons.kind.String .. ' ',
          Struct = icons.kind.Struct .. ' ',
          Text = icons.kind.Text .. ' ',
          TypeParameter = icons.kind.TypeParameter .. ' ',
          Unit = icons.kind.Unit .. ' ',
          Value = icons.kind.Value .. ' ',
          Variable = icons.kind.Variable .. ' ',
        },
      }
    end,
  },
}
