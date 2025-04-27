local M = {}

local function color(item, group_name)
  return '%#' .. group_name .. '#' .. item .. '%*'
end

local function system_name()
  if vim.fn.has 'linux' then
    local text = ' Linux'
    return color(text, 'Winbar_OS')
  elseif vim.fn.has 'mac' then
    local text = ' MacOS'
    return color(text, 'Winbar_OS')
  else
    local text = ' Windows 11'
    return color(text, 'Winbar_OS')
  end
end

local function server_name(client_name)
  local icons = require 'lib.lsp-icons'
  local msg = 'No Active Lsp'
  local excludes = { 'tailwindcss', 'emmet_language_server', 'cssmodules_ls' }
  if client_name and not vim.tbl_contains(excludes, client_name) then
    local server_icon = icons[client_name] or icons[msg] or ''
    return color(client_name .. ' ' .. server_icon, 'Winbar_LSP')
  end
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return color(msg, 'Winbar_Lsp')
  end
  if rawget(vim, 'lsp') then
    for _, client in ipairs(clients) do
      if client.attached_buffers[bufnr] and not vim.tbl_contains(excludes, client.name) then
        client_name = client.name or msg
        local server_icon = icons[client_name] or icons[msg] or ''
        return color(client_name .. ' ' .. server_icon, 'Winbar_LSP')
      end
    end
  end
  return color(msg, 'Winbar_Lsp')
end

function M.get_winbar(client_name)
  local lsp = {
    text = server_name(client_name),
    l = color('', 'Winbar_Lsp_Separator'),
    r = color('', 'Winbar_Lsp_Separator'),
  }
  local system = {
    text = system_name(),
    l = color(' ', 'Winbar_OS_Separator'),
    r = color(' ', 'Winbar_OS_Separator'),
  }

  local args = '%s'
  return '%=' .. string.format(args:rep(6), lsp.l, lsp.text, lsp.r, system.l, system.text, system.r)
end

return M
