local function dashboard(group, name, opts)
  group['Dashboard' .. name] = opts
end

local function bufferline(group, name, opts)
  group['BufferLine' .. name] = opts
end

local function telescope(group, name, opts)
  group['Telescope' .. name] = opts
end

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local transparent = true
      require('tokyonight').setup {
        transparent = transparent,
        style = 'night',
        on_highlights = function(group, c)
          local util = require 'tokyonight.util'
          local darken = util.darken

          group.LspInlayHint = { fg = darken(c.blue1, 0.7), bg = 'NONE' }
          group['@lsp.typemod.function.defaultLibrary'] = { link = 'Function' }
          group['HopNextKey'] = { fg = c.orange }
          group['PmenuThumb'] = { bg = c.orange }
          group['Pmenu'] = { bg = 'NONE' }
          group['PmenuSel'] = { fg = c.orange, reverse = true }
          group['WinSeparator'] = { fg = c.border_highlight }
          -- group['WhichKeyBorder'] = { link = 'WinSeparator' }
          -- group['CursorLineNr'] = { fg = c.green1 }
          dashboard(group, 'Header', { fg = c.purple })
          dashboard(group, 'Desc', { fg = c.fg })
          dashboard(group, 'Icon', { link = 'Directory' })
          dashboard(group, 'Key', { fg = c.green1 })
          dashboard(group, 'Footer', { fg = c.comment })
          telescope(group, 'Border', { fg = c.blue, bg = c.bg_float })
          telescope(group, 'PromptTitle', { fg = c.orange, reverse = true })
          telescope(group, 'ResultsTitle', { fg = c.green1, reverse = true })
          telescope(group, 'PreviewTitle', { fg = c.green1, reverse = true })
          telescope(group, 'SelectionCaret', { fg = c.orange, bg = c.bg_highlight })

          if transparent then
            bufferline(group, 'Fill', { bg = c.bg })
            bufferline(group, 'Separator', { fg = c.bg })
            bufferline(group, 'SeparatorSelected', { link = 'BufferLineSeparator' })
            bufferline(group, 'SeparatorVisible', { link = 'BufferLineSeparator' })
          end
        end,
      }

      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
