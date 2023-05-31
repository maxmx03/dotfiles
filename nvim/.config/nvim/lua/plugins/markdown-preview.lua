return {
  {
    'toppair/peek.nvim',
    build = 'deno task --quiet build:fast',
    ft = { 'markdown' },
    config = function()
      require('peek').setup {
        auto_load = true,        -- whether to automatically load preview when
        close_on_bdelete = true, -- close preview window on buffer delete
        syntax = true,           -- enable syntax highlighting, affects performance
        theme = 'dark',          -- 'dark' or 'light'
        update_on_change = true,
        app = 'browser', -- 'webview', 'browser', string or a table of strings
        filetype = { 'markdown' }, -- list of filetypes to recognize as markdown
        throttle_at = 200000,   -- start throttling when file exceeds this
        throttle_time = 'auto', -- minimum amount of time in milliseconds
      }
    end,
  },
}
