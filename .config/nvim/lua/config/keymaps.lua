local map = vim.keymap.set
local opts = { silent = true }

-- NOTE: basic
map('n', '<c-t>', '<c-]>', opts)
map('n', 'Ss', '<cmd>split<cr>', opts)
map('n', 'Sv', '<cmd>vsplit<cr>', opts)
map('n', '+', '<c-a>', opts)
map('n', '-', '<c-x>', opts)

-- NOTE: window-pick
map('n', '<tab>', '<cmd>WindowPick<cr>', opts)

-- NOTE: bufferline
map('n', '<c-right>', '<cmd>BufferLineCycleNext<cr>', opts)
map('n', '<c-left>', '<cmd>BufferLineCyclePrev<cr>', opts)
map('n', '<c-up>', '<cmd>BufferLinePick<cr>', opts)
map('n', '<c-down>', '<cmd>BufferLinePickClose<cr>', opts)
map('n', '<c-x>', '<cmd>bdelete<cr>', opts)

local normal = {
  mode = { 'n' },
  { '<leader>w', '<cmd>update<cr>', desc = 'save' },
  { '<leader>q', '<cmd>quit<cr>', desc = 'quit' },
  { '<leader>T', '<cmd>Theme<cr>', desc = 'ui' },
  { '<leader>;', '<cmd>Dashboard<cr>', desc = 'dashboard' },
  { '<leader>/', '<Plug>(comment_toggle_linewise_current)', desc = 'comment' },
  { '<leader>k', '<cmd>ShowkeysToggle<cr>', desc = 'nvchad keys' },
  {
    '<leader>e',
    '<cmd>ToggleFileExplorer<cr>',
    desc = 'file explorer',
  },
  { '<leader>L', group = 'lazy' },
  { '<leader>Lp', '<cmd>Lazy profile<cr>', desc = 'profile' },
  { '<leader>Lh', '<cmd>Lazy home<cr>', desc = 'home' },
  { '<leader>Lu', '<cmd>Lazy update<cr>', desc = 'update' },
  { '<leader>Lr', '<cmd>Lazy restore<cr>', desc = 'restore' },
  { '<leader>l', group = 'code' },
  { '<leader>lf', '<cmd>Conform<cr>', desc = 'format' },
  { '<leader>lh', vim.lsp.buf.hover, desc = 'hover' },
  { '<leader>la', vim.lsp.buf.code_action, desc = 'action' },
  { '<leader>ld', vim.lsp.buf.definition, desc = 'definition' },
  { '<leader>li', vim.lsp.buf.implementation, desc = 'implementation' },
  { '<leader>lt', vim.lsp.buf.type_definition, desc = 'type definition' },
  { '<leader>lr', vim.lsp.buf.rename, desc = 'rename' },
  { '<leader>ls', vim.lsp.buf.document_symbol, desc = 'document symbol' },
  { '<leader>lm', '<cmd>Man<cr>', desc = 'man' },
  { '<leader>lo', '<cmd>AerialToggle<cr>', desc = 'code outline' },
  { '<leader>d', group = 'diagnostic' },
  { '<leader>dn', vim.diagnostic.goto_next, desc = 'next' },
  { '<leader>dp', vim.diagnostic.goto_prev, desc = 'prev' },
  { '<leader>do', vim.diagnostic.open_float, desc = 'open float' },
  { '<leader>s', group = 'telescope' },
  { '<leader>sf', '<cmd>Telescope find_files theme=dropdown<cr>', desc = 'find files' },
  { '<leader>sb', '<cmd>Telescope buffers theme=dropdown<cr>', desc = 'buffers' },
  { '<leader>sT', '<cmd>Telescope highlights theme=dropdown<cr>', desc = 'highlights' },
  { '<leader>sg', '<cmd>Telescope live_grep theme=dropdown<cr>', desc = 'grep' },
  { '<leader>m', group = 'mason' },
  { '<leader>mm', '<cmd>Mason<cr>', desc = 'packages' },
  { '<leader>ml', '<cmd>MasonLog<cr>', desc = 'logs' },
  { '<leader>mu', '<cmd>MasonUpdate<cr>', desc = 'update' },
  { '<leader>ma', '<cmd>MasonUpdate<cr>', desc = 'uninstall all' },
  { '<leader>t', group = 'terminal' },
  { '<leader>tt', '<cmd>TermOpen<cr>', desc = 'open' },
  { '<leader>tr', '<cmd>Runner<cr>', desc = 'exec program' },
  { '<leader>p', group = 'minty' },
  { '<leader>ps', '<cmd>Shades<cr>', desc = 'shades' },
  { '<leader>ph', '<cmd>Huefy<cr>', desc = 'huefy' },
  { '<leader>c', group = 'Codecompanion' },
  { '<leader>cc', '<cmd>CodeCompanionChat<cr>', desc = 'chat' },
  { '<leader>ci', '<cmd>CodeCompanion<cr>', desc = 'inline' },
  { '<leader>ca', '<cmd>CodeCompanionActions<cr>', desc = 'actions' },
  { '<leader>ct', '<cmd>CodeCompanionCmd<cr>', desc = 'cmd' },
  { '<leader>n', group = 'NeoTest' },
  { '<leader>nn', '<cmd>Neotest run<cr>', desc = 'run' },
  { '<leader>ns', '<cmd>Neotest summary<cr>', desc = 'summary' },
  { '<leader>no', '<cmd>Neotest output<cr>', desc = 'test' },
  { '<leader>np', '<cmd>Neotest output-panel<cr>', desc = 'test panel' },
}

local visual = {
  mode = { 'v' },
  { '<leader>/', '<Plug>(comment_toggle_linewise_visual)', desc = 'comment' },
  { '<leader>cc', '<cmd>CodeCompanionExplain<cr>', desc = 'inline' },
}

local terminal = {
  mode = { 't' },
  { '<leader>tt', '<cmd>TermHide<cr>', desc = 'Hide' },
  { '<leader>tc', '<cmd>TermClose<cr>', desc = 'Close' },
}

return {
  normal,
  visual,
  terminal,
}
