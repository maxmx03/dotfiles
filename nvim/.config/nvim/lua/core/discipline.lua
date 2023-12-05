local M = {}

local keys = {
  'h',
  'j',
  'k',
  'l',
  '<Left>',
  '<Down>',
  '<Up>',
  '<Right>',
}
local icon = '🤠'

function M.cowboy()
  local id
  local ok = true
  for _, key in ipairs(keys) do
    local count = 0
    local timer = assert(vim.uv.new_timer())
    local map = key
    vim.keymap.set('n', key, function()
      if vim.v.count > 0 then
        count = 0
      end
      if count >= 10 then
        ok, id = pcall(vim.notify, 'Hold it Cowboy!', vim.log.levels.WARN, {
          icon = icon,
          replace = id,
          keep = function()
            return count >= 10
          end,
        })
        if not ok then
          id = nil
          return map
        end
      else
        count = count + 1
        timer:start(2000, 0, function()
          count = 0
        end)
        return map
      end
    end, { expr = true, silent = true })
  end
end

function M.cowboy_gets_shot()
  local ok = true
  for _, key in ipairs(keys) do
    local map = key
    vim.keymap.set('n', key, function()
      return map
    end, { expr = true, silent = true })
  end

  ok, _G.cowboy_id = pcall(vim.notify, 'Cowboy got shot', vim.log.levels.WARN, {
    icon = icon,
    replace = _G.cowboy_id,
  })

  if not ok then
    _G.cowboy_id = nil
  end
end

return M
