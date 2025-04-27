local command = vim.api.nvim_create_user_command
local theme = require 'lib.theme'

command('Transparent', function()
  ---@type base46
  local base46 = require 'base46'
  if base46.transparency == 1 then
    base46.transparency = 0
  else
    base46.transparency = 1
  end
  base46.store()
  base46.reload()
end, {})

command('Theme', theme.pick, {})

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
    local runners = require 'lib.runners'
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

command('CodeCompanionExplain', function()
  require('codecompanion').prompt 'explain'
end, {})
