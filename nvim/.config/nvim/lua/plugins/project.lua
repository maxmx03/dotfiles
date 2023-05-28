return {
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        patterns = { '.git', '.gitignore', '.toml', '.conf', 'LICENSE' },
      }
    end,
  },
}
