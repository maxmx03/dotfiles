local build = './dl_binaries.sh'

if vim.fn.has 'win32' == 1 then
  build = 'pwsh.exe -file .\\dl_binaries.ps1'
end

return {
  {
    'codota/tabnine-nvim',
    build = build,
    config = function()
      local solarized_palette = require 'solarized.palette'
      local colors = solarized_palette.get_colors()

      require('tabnine').setup {
        disable_auto_comment = true,
        accept_keymap = '<Tab>',
        dismiss_keymap = '<C-]>',
        debounce_ms = 800,
        suggestion_color = { gui = colors.base01, cterm = 244 },
        exclude_filetypes = { 'TelescopePrompt', 'NvimTree' },
        log_file_path = nil, -- absolute path to Tabnine log file
      }
    end,
  },
}
