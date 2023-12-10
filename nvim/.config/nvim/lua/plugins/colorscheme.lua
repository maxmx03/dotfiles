return {
  {
    'maxmx03/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local transparent = false
      _G.colors = require('tokyonight.colors').default

      local function dashboard(group, name, opts)
        group['Dashboard' .. name] = opts
      end

      local function bufferline(group, name, opts)
        group['BufferLine' .. name] = opts
      end

      require('tokyonight').setup {
        transparent = transparent,
        on_highlights = function(group, c)
          local util = require 'tokyonight.util'
          local darken = util.darken

          group.LspInlayHint = { fg = darken(c.blue1, 0.7), bg = 'NONE' }
          group['@lsp.typemod.function.defaultLibrary'] = { link = 'Function' }
          group['HopNextKey'] = { fg = c.orange }
          group['TelescopeSelectionCaret'] = { fg = c.purple }
          dashboard(group, 'Header', { fg = c.purple })
          dashboard(group, 'Desc', { fg = c.fg })
          dashboard(group, 'Icon', { link = 'Directory' })
          dashboard(group, 'Key', { fg = c.green1 })
          dashboard(group, 'Footer', { fg = c.comment })

          if transparent then
            bufferline(group, 'Fill', { bg = c.bg })
            bufferline(group, 'Separator', { fg = c.bg })
            bufferline(group, 'SeparatorSelected', { link = 'BufferLineSeparator' })
            bufferline(group, 'SeparatorVisible', { link = 'BufferLineSeparator' })
          end
        end,
      }

      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
