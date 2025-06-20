return {
  'rmagatti/auto-session',
  lazy = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projetos', '~/Downloads' },
    bypass_save_filetypes = { 'bash', 'dashboard', 'neo-tree' },
    auto_restore = false,
  },
}
