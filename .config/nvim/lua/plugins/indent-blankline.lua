local highlight = {
  'IblColumn',
  'Whitespace',
}

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = { highlight = highlight, char = '' },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          'neo-tree',
          'dashboard',
          'markdown',
          'help',
        },
      },
    },
  },
}
