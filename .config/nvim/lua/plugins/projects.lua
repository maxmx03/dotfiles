return {
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        patterns = {
          '.git',
          'LICENSE',
          'package.json',
          '.luarc.json',
        },
      }
    end,
  },
}
