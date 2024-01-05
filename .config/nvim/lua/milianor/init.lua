local icons = require 'milianor.icons'

---@class milianor
---@field linters table
---@field servers table
---@field formatters table
---@field open_ui fun(options: string[], title: string, actions: string[])
---@field quit function
---@field format fun(buf: number)
---@field icons milianor.icons

---@type milianor
local M = {}

M.servers = {
  'lua_ls',
  'tsserver',
  'eslint',
  'html',
  'emmet_ls',
  'cssls',
  'cssmodules_ls',
  'vimls',
  'bashls',
  'marksman',
  'pyright',
  'angularls',
}

M.formatters = {
  'stylua',
  'prettier',
  'beautysh',
  'black',
}

M.linters = {
  'markdownlint',
}

M.icons = icons

M.open_ui = function(options, title, actions)
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

M.quit = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_get_option_value('modified', { buf = bufnr })

  if modified then
    M.open_ui({ 'save', 'quit' }, 'You have unsaved changes', { 'update', 'quit!' })
  else
    vim.cmd.quit()
  end
end

M.format = function(buf)
  local bufnr = buf or vim.api.nvim_get_current_buf()
  vim.lsp.buf.format { buf = bufnr }
end

return M
