---@class hydra.telescope
local M = {}

---@param Hydra function
---@param cmd function
function M.load(Hydra, cmd)
  local hint = [[
                 _f_: files       _g_: live grep
   🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _p_: projects    _t_: themes
  🭉🭁🭠🭘    🭣🭕🭌🬾   _h_: highlights
  🭅█ ▁     █🭐
  ██🬿      🭊██
 🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀
 🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙
                 _<Enter>_: Telescope           _<Esc>_
]]

  Hydra {
    name = 'Telescope',
    hint = hint,
    config = {
      color = 'teal',
      invoke_on_body = true,
      hint = {
        position = 'middle',
        float_opts = {
          style = 'minimal',
          border = 'rounded',
          focusable = false,
          noautocmd = true,
        },
      },
    },
    mode = 'n',
    body = '<Leader>t',
    heads = {
      { 'f', cmd 'Telescope find_files' },
      { 'p', cmd 'Telescope session-lens' },
      { 'g', cmd 'Telescope live_grep' },
      { 'h', cmd 'Telescope highlights' },
      { 't', cmd 'Telescope themes' },
      { '<Esc>', nil, { exit = true, nowait = true } },
      { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
    },
  }
end

return M
