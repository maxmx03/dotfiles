local M = {}

function M:new(t)
  setmetatable(t, self)
  return t
end

M.__add = function(...)
  local list = {}
  local tables = { ... }

  for _, t in pairs(tables) do
    for _, value in pairs(t) do
      table.insert(list, value)
    end
  end

  return list
end

return M
