local M = {}

function M:new()
  local t = {}

  setmetatable(t, self)
  self.__index = self

  return t
end

function M.open_ui(options, title, actions)
  vim.ui.select(options, {
    prompt = title,
  }, function(choice)
    for key, option in ipairs(options) do
      if choice == option then
        vim.cmd(actions[key])
      end
    end
  end)
end

function M:smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, 'modified')

  if modified then
    self.open_ui({ 'save', 'quit' }, 'You have unsaved changes', { 'update', 'quit!' })
  else
    vim.cmd.quit()
  end
end

return M:new()
