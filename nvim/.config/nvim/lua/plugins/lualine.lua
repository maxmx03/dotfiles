return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local color = require 'onedarkpro.helpers'
      local colors = color.get_colors()

      local custom_theme = {
        normal = {
          a = { fg = colors.black, bg = colors.blue },
          b = { fg = colors.white, bg = colors.bglight },
          c = { fg = colors.red, bg = colors.bg_statusline },
        },
        insert = {
          a = { fg = colors.black, bg = colors.purple },
        },
        visual = {
          a = { fg = colors.black, bg = colors.cyan },
        },
        replace = {
          a = { fg = colors.black, bg = colors.red },
        },
        inactive = {
          a = { fg = colors.white, bg = colors.black },
          b = { fg = colors.white, bg = colors.black },
          c = { fg = colors.black, bg = colors.black },
        },
      }

      local sections = {}

      local icons = {
        vim = '',
        git = '',
        default = { left = '', right = ' ' },
        round = { left = '', right = '' },
        block = { left = '█', right = '█' },
        arrow = { left = '', right = '' },
      }

      local function ins_config(location, component)
        sections['lualine_' .. location] = component
      end

      ins_config('a', {
        {
          'mode',
          icon = icons.vim,
          separator = { left = icons.block.left, right = icons.default.right },
          right_padding = 2,
        },
      })

      ins_config('b', {
        {
          'filename',
          fmt = function(filename)
            local icon = '󰈚'

            local devicons_present, devicons = pcall(require, 'nvim-web-devicons')

            if devicons_present then
              local ft_icon = devicons.get_icon(filename)
              icon = (ft_icon ~= nil and ft_icon) or icon
            end

            return string.format('%s %s', icon, filename)
          end,
        },
      })

      ins_config('c', {
        {
          'branch',
          icon = icons.git,
        },
      })

      ins_config('x', {})

      ins_config('y', {
        {
          'progress',
          fmt = function(progress)
            local spinners = { '󰝦', '󰪞', '󰪠', '󰪡', '󰪢', '󰪣', '󰪤', '󰪥' }

            if string.lower(progress) == 'top' then
              return spinners[1]
            elseif string.lower(progress) == 'bot' then
              return spinners[#spinners]
            end

            local p = tonumber(string.match(progress, '%d+'))

            if p ~= nil then
              local index = math.floor((p - 1) / (100 / #spinners)) + 1
              return spinners[index]
            end
          end,
          separator = { right = icons.block.right },
          left_padding = 2,
        },
      })

      ins_config('z', {
        {
          function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_get_option_value('filetype', { win = 0 })
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                if client.name ~= 'null-ls' then
                  return client.name
                end
              end
            end
            return msg
          end,
        },
      })

      require('lualine').setup {
        options = {
          theme = custom_theme,
          component_separators = '|',
          section_separators = { left = icons.default.right, right = icons.default.left },
          disabled_filetypes = {
            'NvimTree',
            'starter',
          },
        },
        sections = sections,
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
}
