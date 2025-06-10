local M = {}

---@param path string
---@param ignore? string[]
---@return string[]
function M.ls(path, ignore)
  local files = vim.fn.readdir(vim.fn.stdpath 'config' .. '/lua/' .. path)
  local file_names = {}
  for _, file in ipairs(files) do
    local invalid_name, filename = pcall(vim.fn.fnamemodify, file, ':r')
    if invalid_name == '' or invalid_name == 'v:null' then
      vim.notify((filename .. '  invalid:'), vim.log.levels.WARN)
    else
      if not vim.tbl_contains(ignore or {}, filename) then
        table.insert(file_names, filename)
      end
    end
  end
  return file_names
end

---@param path string
---@return boolean|nil
---@return string|nil
function M.mkdir(path)
  local stat = vim.uv.fs_statfs(path)
  if stat == nil then
    local ok, err = vim.uv.fs_mkdir(path, 493)
    if not ok then
      return false, err
    else
      return true
    end
  end
  return true
end

---@return string
function M.pwd()
  local dir, err, err_name = vim.uv.cwd()
  if err ~= nil or dir == nil or string.len(dir) == 0 then
    if err_name then
      return ''
    end
    return ''
  end
  return dir
end

return M
