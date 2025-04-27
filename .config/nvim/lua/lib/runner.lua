---@class RunnerParams
---@field root_files table
---@field cmd string
---@field dir string
---@field makeBin? boolean

---@class Runner
---@field new fun(self: Runner, t: RunnerParams): table
---@field create fun(self: Runner): string?
local Runner = {
  root_files = {},
  cmd = '',
  dir = '',
  makeBin = true,
}

function Runner:new(t)
  setmetatable(t or {}, Runner)
  self.__index = self
  return t
end

function Runner:create()
  local root_dir = vim.fs.root(self.dir, self.root_files)
  if not root_dir then
    return
  end
  if self.makeBin then
    local mkdir = require 'lib.mkdir'
    local ok, err = mkdir(root_dir .. '/bin')
    if not ok then
      vim.notify(string.format('Err: %s', err), vim.log.levels.ERROR)
      return
    end
  end
  local file = vim.fn.expand '%:t'
  local program = string.format('%s/%s', root_dir, file)
  return string.format(self.cmd, program)
end

return Runner
