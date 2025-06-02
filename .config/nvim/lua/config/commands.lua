local command = vim.api.nvim_create_user_command
command('Runner', function()
  local dir, err, err_name = vim.uv.cwd()
  if err ~= nil or dir == nil or string.len(dir) == 0 then
    if err_name then
      return
    end
    return
  end

  local dirs = vim.fs.find({ 'makefile', 'Makefile' }, { path = dir, upward = true, limit = 1 })
  local default = function()
    local runners = require 'config.toggleterm.runners'
    local runner = runners[vim.bo.filetype]
    local arg = runner(dir)
    vim.cmd.TermExec('cmd=' .. arg)
  end

  if vim.tbl_isempty(dirs) then
    default()
  else
    vim.cmd.TermExec 'cmd=make'
  end
end, { nargs = 0, bang = false })
