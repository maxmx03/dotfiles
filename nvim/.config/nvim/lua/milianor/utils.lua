local M = {}

function M:new()
  local t = {
    preview_markdown_dont_show_again = false,
  }

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

function M:preview_markdown()
  local cmd = 'lua require("milianor.utils").preview_markdown_dont_show_again = true'

  if not self.preview_markdown_dont_show_again then
    M.open_ui({ 'yes', 'no', "no, don't show again" }, 'Preview Markdown?', { 'MarkdownPreview', '', cmd })
  end
end

return M:new()
