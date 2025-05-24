local M = {}

local function color(item, group_name)
  return '%#' .. group_name .. '#' .. item .. '%*'
end

local function system_name()
  if vim.fn.has 'linux' then
    local text = ' Linux'
    return color(text, 'WinbarText')
  elseif vim.fn.has 'mac' then
    local text = ' MacOS'
    return color(text, 'WinbarText')
  else
    local text = ' Windows 11'
    return color(text, 'WinbarText')
  end
end

local function server_name(client_name)
  local icons = require 'lib.lsp-icons'
  local msg = 'No Active Lsp'
  local excludes = { 'tailwindcss', 'emmet_language_server', 'cssmodules_ls' }
  if client_name and not vim.tbl_contains(excludes, client_name) then
    local server_icon = icons[client_name] or icons[msg] or ''
    return color(client_name .. ' ' .. server_icon, 'WinbarText')
  end
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return color(msg, 'WinbarText')
  end
  if rawget(vim, 'lsp') then
    for _, client in ipairs(clients) do
      if client.attached_buffers[bufnr] and not vim.tbl_contains(excludes, client.name) then
        client_name = client.name or msg
        local server_icon = icons[client_name] or icons[msg] or ''
        return color(client_name .. ' ' .. server_icon, 'WinbarText')
      end
    end
  end
  return color(msg, 'WinbarText')
end

function M.get_winbar(client_name)
  local lsp = {
    text = server_name(client_name),
    l = color('', 'Winbar_Separator'),
    r = color('', 'Winbar_Separator'),
  }
  local system = {
    text = system_name(),
    l = color(' ', 'Winbar_Separator'),
    r = color(' ', 'Winbar_Separator'),
  }

  local args = '%s'
  return '%=' .. string.format(args:rep(6), lsp.l, lsp.text, lsp.r, system.l, system.text, system.r)
end

return M
