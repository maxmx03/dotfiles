---@diagnostic disable: missing-fields

---@class confirm_quit.config
---@field options table
---@field title string
---@field actions table

---@class confirm_quit
---@field config confirm_quit.config
---@field setup fun(config: confirm_quit.config)
---@field confirm_quit fun(config: confirm_quit.config)

---@type confirm_quit
local M = {
  config = {
    title = 'You have unsaved changes',
    options = { 'save and quit', 'quit' },
    actions = { 'w', 'quit!' },
  },
}

---@param config confirm_quit.config
function M.confirm_quit(config)
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
end

---@param config confirm_quit.config
M.setup = function(config)
  config = vim.tbl_deep_extend('force', M.config, config)
  local group = vim.api.nvim_create_augroup('confirm_quit', { clear = true })
  vim.api.nvim_create_autocmd('QuitPre', {
    group = group,
    callback = function()
      M.confirm_quit(config)
    end,
  })
end

return M
