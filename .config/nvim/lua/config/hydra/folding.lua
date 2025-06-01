local o = vim.o

---@class hydra.folding
local M = {}

---@alias foldmethod 'manual' | 'expr' | 'indent' | 'syntax' | 'marker' | 'diff'

local function toggle_folding()
  o.foldenable = not o.foldenable
end

---@param method foldmethod
local function is_foldmethod_active(method)
  if o.foldmethod == method then
    return ''
  else
    return ''
  end
end

---@param method foldmethod
local function enable_fold_method(method)
  o.foldmethod = method
  if not o.foldenable then
    toggle_folding()
  end
end

---@param Hydra function
function M.load(Hydra)
  local hint = [[
  ^ ^        Fold-methods
  ^
  _z_ %{fdn} toggle fold
  _m_ %{fdm} manual
  _i_ %{fdi} indent
  _k_ %{fmr} marker
  _t_ %{fde} expr
  _d_ %{fdd} diff
  ^
       ^^^^                _<Esc>_
]]

  Hydra {
    name = 'Options',
    hint = hint,
    config = {
      color = 'amaranth',
      invoke_on_body = true,
      hint = {
        position = 'middle',
        float_opts = {
          style = 'minimal',
          border = 'rounded',
          -- focusable = false,
          -- noautocmd = true,
        },
        funcs = {
          fdn = function()
            if o.foldenable then
              return ''
            else
              return ''
            end
          end,
          fdm = function()
            return is_foldmethod_active 'manual'
          end,
          fdi = function()
            return is_foldmethod_active 'indent'
          end,
          fmr = function()
            return is_foldmethod_active 'marker'
          end,
          fde = function()
            return is_foldmethod_active 'expr'
          end,
          fdd = function()
            return is_foldmethod_active 'diff'
          end,
        },
      },
    },
    mode = { 'n' },
    body = '<leader>z',
    heads = {
      { 'z', toggle_folding },
      {
        'm',
        function()
          enable_fold_method 'manual'
        end,
      },
      {
        'i',
        function()
          enable_fold_method 'indent'
        end,
      },
      {
        'k',
        function()
          enable_fold_method 'marker'
        end,
      },
      {
        't',
        function()
          enable_fold_method 'expr'
        end,
      },
      {
        'd',
        function()
          enable_fold_method 'diff'
        end,
      },
      { '<Esc>', nil, { exit = true, nowait = true } },
    },
  }
end

return M
