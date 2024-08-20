local M = {
  config = {
    title = 'You have unsaved changes',
    options = { 'save and quit', 'quit' },
    actions = { 'wq', 'quit!' },
  },
}

M.confirm_quit = vim.schedule_wrap(function()
  local config = M.config
  local options = config.options
  local actions = config.actions
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_get_option_value('modified', { buf = bufnr })

  if modified then
    local opts = {
      prompt = config.title,
    }

    vim.ui.select(options, opts, function(text)
      for action, option in ipairs(options) do
        if text == option then
          vim.cmd(actions[action])
        end
      end
    end)
  else
    vim.cmd.quit()
  end
end)

return M
