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
    local runners = require 'config.terminal.runners'
    local runner = runners[vim.bo.filetype]
    local arg = runner(dir)
    vim.cmd.TermOpen(arg)
  end

  if vim.tbl_isempty(dirs) then
    default()
  else
    vim.ui.select({ 'yes', 'no' }, {
      prompt = 'Makefile detected. Would you like to run it?',
    }, function(choice)
      if choice == 'yes' then
        vim.cmd.TermOpen 'make'
      else
        default()
      end
    end)
  end
end, { nargs = 0, bang = false })
