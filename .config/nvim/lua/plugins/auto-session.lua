return {
  'rmagatti/auto-session',
  lazy = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = {},
    bypass_save_filetypes = { 'bash', 'dashboard', 'neo-tree' },
    auto_restore = false,
    auto_restore_last_session = false,
    auto_delete_empty_sessions = true,
    purge_after_minutes = 14400,
  },
}
