local unix = require 'include.unix'
local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_set = require 'telescope.actions.set'
local action_state = require 'telescope.actions.state'
local themes = unix.ls 'core/base46/colors'

local function switcher()
  local picker = pickers.new {
    prompt_title = '󱥚 Set Base46 Theme',
    finder = finders.new_table {
      results = themes,
    },
    sorter = conf.generic_sorter(),
    attach_mappings = function(prompt_bufnr)
      vim.schedule(function()
        vim.api.nvim_create_autocmd('TextChangedI', {
          buffer = prompt_bufnr,
          callback = function()
            if action_state.get_selected_entry() then
              vim.cmd.colorscheme(action_state.get_selected_entry()[1])
            end
          end,
        })
      end)

      actions.move_selection_previous:replace(function()
        action_set.shift_selection(prompt_bufnr, -1)
        vim.cmd.colorscheme(action_state.get_selected_entry()[1])
      end)
      actions.move_selection_next:replace(function()
        action_set.shift_selection(prompt_bufnr, 1)
        vim.cmd.colorscheme(action_state.get_selected_entry()[1])
      end)
      actions.select_default:replace(function()
        if action_state.get_selected_entry() then
          vim.cmd.colorscheme(action_state.get_selected_entry()[1])
          actions._close(prompt_bufnr)
        end
      end)
      return true
    end,
  }

  picker:find()
end

return require('telescope').register_extension {
  exports = {
    themes = switcher,
  },
}
