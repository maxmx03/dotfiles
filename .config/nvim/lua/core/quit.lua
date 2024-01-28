local open_ui = function(options, title, actions)
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

local function quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_get_option_value('modified', { buf = bufnr })

  if modified then
    open_ui({ 'save & quit', 'quit' }, 'You have unsaved changes', { 'wq', 'quit!' })
  else
    vim.cmd.quit()
  end
end

return quit
