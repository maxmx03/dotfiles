---@param path string
local function mkdir(path)
  local stat = vim.uv.fs_statfs(path)
  if stat == nil then
    local ok, err = vim.uv.fs_mkdir(path, 493)
    if not ok then
      return err
    end
  end
  return true, nil
end

return mkdir
