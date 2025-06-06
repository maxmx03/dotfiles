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
function M.mkdir(path)
  local stat = vim.uv.fs_statfs(path)
  if stat == nil then
    local ok, err = vim.uv.fs_mkdir(path, 493)
    if not ok then
      return err
    end
  end
  return true, nil
end

return M
