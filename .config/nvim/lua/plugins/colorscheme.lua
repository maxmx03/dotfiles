return {
  {
    'maxmx03/dracula.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local dracula = require 'dracula'
      local transparent = false

      dracula.setup {
        transparent = transparent,
        on_highlights = function(colors, color)
          if transparent then
            local background = color.shade(colors.base02, 2)
            return {
              BufferLineFill = { bg = background },
              BufferLineBufferSelected = { fg = colors.base0 },
              BufferLineSeparator = { fg = background },
              BufferLineSeparatorSelected = { fg = background },
              BufferLineSeparatorVisible = { fg = background },
            }
          else
            return {}
          end
        end,
      }

      vim.cmd.colorscheme 'dracula'
    end,
  },
}
