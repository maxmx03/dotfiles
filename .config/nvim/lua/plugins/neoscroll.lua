return {
  'karb94/neoscroll.nvim',
  config = function()
    local neoscroll = require 'neoscroll'
    neoscroll.setup {
      mappings = { -- Keys to be mapped to their corresponding default scrolling animation
        '<C-u>',
        '<C-d>',
      },
      hide_cursor = true, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing = 'linear', -- Default easing function
      pre_hook = nil, -- Function to run before the scrolling animation starts
      post_hook = nil, -- Function to run after the scrolling animation ends
      performance_mode = false, -- Disable "Performance Mode" on all buffers.
      ignored_events = { -- Events ignored while scrolling
        'WinScrolled',
        'CursorMoved',
      },
    }
    local keymap = {
      ['<C-e>'] = function()
        neoscroll.ctrl_u { duration = 250 }
      end,
    }
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
