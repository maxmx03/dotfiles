local M = {}

function M:new(t)
  setmetatable(t, self)
  return t
end

M.__add = function(...)
  local list = {}
  local tables = { ... }
  local blacklist = { 'eslint' }

  for _, t in pairs(tables) do
    for _, value in pairs(t) do
      if not vim.tbl_contains(blacklist, value) then
        table.insert(list, value)
      end
    end
  end

  return list
end

return M
