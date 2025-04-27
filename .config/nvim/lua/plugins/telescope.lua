return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      prompt_prefix = '󰭎 ',
      selection_caret = '  ',
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      file_ignore_patterns = {
        '.git/',
        'node_modules/*',
        '%.jpg',
        '%.jpeg',
        '%.png',
        '%.svg',
        '%.otf',
        '%.ttf',
        '%.webp',
        '.gradle/',
        '.idea/',
        '.settings/',
        '.vscode/',
        '__pycache__/',
        'build/',
        'env/',
        'gradle/',
        'smalljre_*/*',
      },
    },
  },
}
