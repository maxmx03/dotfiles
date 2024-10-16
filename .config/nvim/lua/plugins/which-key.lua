return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local quit = require 'utils.confirm-quit'
    local harpoon = require 'harpoon'
    local wk = require 'which-key'
    wk.add {
      {
        '<F4>',
        function()
          require('nvchad.term').toggle { pos = 'float', id = 'floatTerm' }
        end,
        desc = 'toggle nvchad.term',
        mode = { 'n', 't' },
      },
      {
        '<F5>',
        require 'utils.runner',
        desc = 'toggle nvchad.runner',
        mode = { 'n', 't' },
      },
      {
        '<leader>/',
        '<Plug>(comment_toggle_linewise_visual)',
        desc = 'Comment toggle current line',
        mode = 'v',
      },
      {},
      {
        '<leader>/',
        '<Plug>(comment_toggle_linewise_current)',
        desc = 'Comment toggle current line',
      },
      { '<leader>t', "<cmd>lua require('nvchad.themes').open()<CR>", desc = 'Theme Picker' },
      { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Open File Tree' },
      { '<leader>f', '<cmd>Telescope find_files theme=dropdown<CR>', desc = 'Find Files' },
      { '<leader>q', quit.confirm_quit, desc = 'Close' },
      { '<leader>Q', '<cmd>quitall<CR>', desc = 'Quit Neovim' },
      { '<leader>;', '<cmd>Nvdash<CR>', desc = 'Open Dashboard' },
      { '<leader>w', '<cmd>update<CR>', desc = 'Save' },
      { '<leader>m', group = 'Package manager' },
      { '<leader>ma', '<cmd>MasonUninstallAll<CR>', desc = 'Uninstall all packages' },
      { '<leader>mm', '<cmd>Mason<CR>', desc = 'Open Mason' },
      { '<leader>mu', '<cmd>MasonUpdate<CR>', desc = 'Update Mason' },
      { '<leader>g', group = 'Git' },
      { '<leader>gC', '<cmd>Telescope git_commits<CR>', desc = 'Commits' },
      { '<leader>gS', '<cmd>Telescope git_stash<CR>', desc = 'Stash' },
      { '<leader>gb', '<cmd>Telescope git_branches<CR>', desc = 'Branchs' },
      { '<leader>gd', '<cmd>Gitsigns diffthis<CR>', desc = 'Open Diff' },
      { '<leader>gp', '<cmd>Gitsigns preview_hunk_inline<CR>', desc = 'Open Inline Diff' },
      { '<leader>gs', '<cmd>Telescope git_status<CR>', desc = 'Status' },
      { '<leader>l', group = 'LSP' },
      {
        '<leader>lb',
        '<cmd>Lspsaga diagnostic_jump_prev<CR>',
        desc = 'Jump previous Diagnostic',
      },
      { '<leader>lc', '<cmd>Lspsaga code_action<CR>', desc = 'Code action' },
      { '<leader>ld', '<cmd>Lspsaga goto_definition<CR>', desc = 'Go to Definition' },
      { '<leader>le', '<cmd>Lspsaga show_buf_diagnostics<CR>', desc = 'Show diagnostic' },
      { '<leader>lf', require('conform').format, desc = 'Format file' },
      { '<leader>lh', '<cmd>Lspsaga hover_doc<CR>', desc = 'Hover' },
      { '<leader>lo', '<cmd>Lspsaga outline<CR>', desc = 'Outline' },
      { '<leader>ll', '<cmd>LspRestart<CR>', desc = 'Lsp restart' },
      {
        '<leader>ln',
        '<cmd>Lspsaga diagnostic_jump_next<CR>',
        desc = 'Jump next Diagnostic',
      },
      { '<leader>lp', '<cmd>Lspsaga peek_definition<CR>', desc = 'Peek Definition' },
      { '<leader>lr', '<cmd>Lspsaga rename<CR>', desc = 'Rename' },
      {
        '<leader>lR',
        '<cmd>Lspsaga project_replace<CR>',
        desc = 'Project Replace',
      },
      {
        '<leader>ls',
        '<cmd>Telescope lsp_document_symbols theme=cursor<CR>',
        desc = 'Document symbols',
      },
      { '<leader>r', group = 'Markdown' },
      {
        '<leader>rr',
        '<cmd>Markview toggle<CR>',
        desc = 'Enable & disable markdown rendering',
      },
      {
        '<leader>rm',
        '<cmd>Markview splitToggle<CR>',
        desc = 'Preview markdown',
      },
      {
        '<leader>rp',
        '<cmd>PasteImage<CR>',
        desc = 'Paste image from system clipboard',
      },
      { '<leader>p', group = 'Plugins' },
      { '<leader>pP', '<cmd>Lazy profile<CR>', desc = 'Open Profile' },
      { '<leader>pc', '<cmd>Lazy clean<CR>', desc = 'Clean Plugins' },
      { '<leader>pp', '<cmd>Lazy home<CR>', desc = 'Open Lazy' },
      { '<leader>ps', '<cmd>Lazy sync<CR>', desc = 'Sync Plugins' },
      { '<leader>pu', '<cmd>Lazy update<CR>', desc = 'Update Plugins' },
      { '<leader>s', group = 'Search' },
      { '<leader>sH', '<cmd>Telescope highlights<CR>', desc = 'Search highlights' },
      { '<leader>sb', '<cmd>Telescope buffers theme=cursor<CR>', desc = 'Search buffers' },
      { '<leader>sc', '<cmd>Telescope commands<CR>', desc = 'Search commands' },
      { '<leader>sf', '<cmd>Telescope find_files<CR>', desc = 'Search files' },
      { '<leader>sh', '<cmd>Telescope help_tags<CR>', desc = 'Search Help Tags' },
      { '<leader>sk', '<cmd>Telescope keymaps<CR>', desc = 'Search keymaps' },
      { '<leader>sp', '<cmd>Telescope projects<CR>', desc = 'Search Projects' },
      { '<leader>sw', '<cmd>Telescope live_grep<CR>', desc = 'Search words' },
      {
        '<leader>ss',
        '<cmd>Telescope spell_suggest theme=cursor<CR>',
        desc = 'Search words',
      },
      { '<leader>h', group = 'Harpoon' },
      {
        '<leader>ha',
        function()
          harpoon:list():add()
        end,
        desc = 'Mark file',
      },
      {
        '<leader>hh',
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Quick menu',
      },
      {
        { '<leader>c', group = 'Minty' },
        { '<leader>cc', '<cmd>lua require("minty.huefy").open()<CR>', desc = 'Open minty hue³' },
        { '<leader>cs', '<cmd>lua require("minty.shades").open()<CR>', desc = 'Open minty shades' },
      },
    }
    wk.setup {
      preset = 'modern',
      icons = {
        mappings = false,
        keys = {
          Space = '',
        },
      },
    }
  end,
}
