vim.keymap.set({ 'n', 'v' }, '<RightMouse>', function()
  require('menu.utils').delete_old_menus()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  require('menu').open({
    {
      name = 'Format Buffer',
      cmd = function()
        local ok, conform = pcall(require, 'conform')
        if ok then
          conform.format { lsp_fallback = true }
        else
          vim.lsp.buf.format()
        end
      end,
      rtxt = '<leader>fm',
    },

    {
      name = 'Code Actions',
      cmd = vim.lsp.buf.code_action,
      rtxt = '<leader>ca',
    },

    { name = 'separator' },

    {
      name = '  Lsp Actions',
      hl = 'Exblue',
      items = 'lsp',
    },

    { name = 'separator' },

    {
      name = 'Edit Config',
      cmd = function()
        vim.cmd 'tabnew'
        local conf = vim.fn.stdpath 'config'
        vim.cmd('tcd ' .. conf .. ' | e init.lua')
      end,
      rtxt = 'ed',
    },

    {
      name = 'Copy Content',
      cmd = '%y+',
      rtxt = '<C-c>',
    },

    {
      name = 'Delete Content',
      cmd = '%d',
      rtxt = 'dc',
    },

    { name = 'separator' },

    {
      name = '  Open in terminal',
      hl = 'ExRed',
      cmd = function()
        vim.cmd 'TermOpen'
      end,
    },
    { name = 'separator' },
    {
      name = '  Color Picker',
      cmd = function()
        require('minty.huefy').open()
      end,
    },
  }, { mouse = true })
end, {})
