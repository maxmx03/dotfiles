local term = require 'nvchad.term'
local config = {
  pos = 'float',
  clear_cmd = false,
  id = 'floatTerm',
}

local function mkdir()
  local stat = vim.uv.fs_statfs './bin'
  if stat == nil then
    local ok = vim.uv.fs_mkdir('bin', 493)
    if not ok then
      return
    end
  end
  return true
end

local runners = {
  ['c'] = function(file)
    local ok = mkdir()
    if not ok then
      return
    end
    config.cmd = string.format('gcc %s -o ./bin/program && ./bin/program', file)
    term.runner(config)
  end,
  ['cpp'] = function(file)
    local ok = mkdir()
    if not ok then
      return
    end
    config.cmd = string.format('g++ %s -o ./bin/program && ./bin/program', file)
    term.runner(config)
  end,
  ['make'] = function()
    config.cmd = 'make'
    term.runner(config)
  end,
}

local notempty = function(s)
  return s ~= '' and s ~= nil
end

local runner = function()
  local options = { 'by filetype', 'run make' }
  vim.ui.select(options, {
    prompt = 'Run with',
  }, function(option)
    if option == options[2] then
      runners['make']()
    elseif option == options[1] then
      local ft = vim.bo.ft
      local file = vim.fn.expand '%:t'
      if notempty(ft) and notempty(file) then
        local runner = runners[ft]
        if type(runner) == 'function' then
          runner(file)
        else
          vim.notify('runner not available for ' .. ft, vim.log.levels.WARN)
        end
      end
    end
  end)
end

return runner
