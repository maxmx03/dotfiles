return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  commit = '206241e451c12f78969ff5ae53af45616ffc9b72',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    filesystem = {
      bind_to_cwd = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = true,
        hide_gitignored = true,
      },
    },
  },
}
