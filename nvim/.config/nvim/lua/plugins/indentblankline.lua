return {
  {
    'lukas-reineke/indent-blankline.nvim',
    commit = 'b2e15a8a2a7c6c06fc4f405844b561fffa123c42',
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append 'space:⋅'

      require('indent_blankline').setup {
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true,
        space_char_blankline = ' ',
      }

      vim.g.indent_blankline_filetype_exclude =
        { 'dashboard', 'lspinfo', 'packer', 'checkhealth', 'help', 'man', 'NvimTree' }
    end,
  },
}
