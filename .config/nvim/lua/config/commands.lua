local command = vim.api.nvim_create_user_command

command('Runner', function()
  local dir, err, err_name = vim.uv.cwd()
  if err ~= nil or dir == nil or string.len(dir) == 0 then
    if err_name then
      return
    end
    return
  end

  local dirs = vim.fs.find({ 'makefile', 'Makefile' }, { path = dir, upward = true, limit = 1 })
  local default = function()
    local runners = require 'config.toggleterm.runners'
    local runner = runners[vim.bo.filetype]
    local arg = runner(dir)
    vim.cmd.TermExec('cmd=' .. arg)
  end

  if vim.tbl_isempty(dirs) then
    default()
  else
    vim.cmd.TermExec 'cmd=make'
  end
end, { nargs = 0, bang = false })

command('MarkdownToggleTask', function()
  local function toggle_checkbox(node)
    local nodes_types = {
      'task_list_marker_unchecked',
      'task_list_marker_checked',
    }
    if node and vim.list_contains(nodes_types, node:type()) then
      local bufnr = vim.api.nvim_get_current_buf()
      local start_row, start_col = node:start()
      local end_row, end_col = node:end_()
      local unchecked_mark =
        vim.api.nvim_buf_get_text(bufnr, start_row, start_col, end_row, end_col, {})[1]
      local new_marker_text
      if unchecked_mark:match '%[x%]' then
        new_marker_text = '[ ]'
      else
        new_marker_text = '[x]'
      end
      vim.api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, { new_marker_text })
    else
      return false
    end
  end
  local node = vim.treesitter.get_node()
  local result = toggle_checkbox(node)
  if not result then
    local sibling = node:next_sibling()
    toggle_checkbox(sibling)
  end
end, { nargs = 0, bang = false })
