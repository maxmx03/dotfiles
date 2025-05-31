local M = {}

---@param path string
---@return string[]
function M.getfiles(path)
  local files = vim.fn.readdir(vim.fn.stdpath 'config' .. '/lua/' .. path)
  local file_names = {}
  for _, file in ipairs(files) do
    local invalid_name, filename = pcall(vim.fn.fnamemodify, file, ':r')
    if invalid_name == '' or invalid_name == 'v:null' then
      vim.notify((filename .. '  invalid:'), vim.log.levels.WARN)
    else
      table.insert(file_names, filename)
    end
  end
  return file_names
end

---@param name string
---@return string
function M.core_plugin(name)
  return vim.fn.stdpath 'config' .. '/lua/core/' .. name
end

return M
