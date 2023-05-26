return {
  {
    'codota/tabnine-nvim',
    build = './dl_binaries.sh',
    config = function()
      local color = require 'onedarkpro.helpers'
      local colors = color.get_colors()

      require('tabnine').setup {
        disable_auto_comment = true,
        accept_keymap = '<Tab>',
        dismiss_keymap = '<C-]>',
        debounce_ms = 800,
        suggestion_color = { gui = colors.comment, cterm = 244 },
        exclude_filetypes = { 'TelescopePrompt' },
        log_file_path = nil, -- absolute path to Tabnine log file
      }
    end,
  },
}
