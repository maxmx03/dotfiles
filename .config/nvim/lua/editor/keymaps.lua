local keymap = require 'utils.keymap'
local nmap = keymap.nmap
local tmap = keymap.tmap
local vmap = keymap.vmap

nmap('<Space>', '<Nop>')
nmap('<C-x>', ':bd<CR>')
nmap('+', '<C-a>')
nmap('-', '<C-x>')
nmap('ss', ':split<CR>')
nmap('sv', ':vsplit<CR>')
nmap('<F7>', ':Inspect<CR>')
nmap('<F8>', ':InspectTree<CR>')
nmap('f', '=<CR>')
nmap('F', '=G<CR>')
nmap('s', ':HopWord<CR>')
nmap('<C-Left>', ':BufferLineCyclePrev<CR>')
nmap('<C-Right>', ':BufferLineCycleNext<CR>')
nmap('<Tab>', function()
  local id = require('window-picker').pick_window()
  if not id then
    return vim.notify('Invalid window', vim.log.levels.WARN)
  end
  vim.api.nvim_set_current_win(id)
end)
tmap('<ESC>', '<c-c> exit<CR>')
vmap('<C-Up>', ":m '<-2<CR>gv=gv")
vmap('<C-Down>', ":m '>+1<CR>gv=gv")

local M = {}

M.normal = {
  {
    '<space>/',
    '<Plug>(comment_toggle_linewise_current)',
    desc = 'Comment toggle current line',
  },
  { '<space>;', ':Dashboard<CR>', desc = 'Open Dashboard' },
  { '<space>M', group = 'Package manager' },
  { '<space>Ma', '<cmd>MasonUninstallAll<cr>', desc = 'Uninstall all packages' },
  { '<space>Mm', '<cmd>Mason<cr>', desc = 'Open Mason' },
  { '<space>Mu', '<cmd>MasonUpdate<cr>', desc = 'Update Mason' },
  { '<space>Q', ':quitall<CR>', desc = 'Quit Neovim' },
  { '<space>b', group = 'Buffer' },
  { '<space>bX', ':BufferLineCloseOther <CR>', desc = 'Exit Others' },
  { '<space>bp', ':BufferLinePick <CR>', desc = 'Pick Buffer' },
  { '<space>bs', ':BufferLineSortByTabs <CR>', desc = 'Sortby Tabs' },
  { '<space>c', group = 'Codota' },
  { '<space>e', ':Neotree toggle left reveal_force_cwd<CR>', desc = 'Open File Tree' },
  { '<space>f', ':Telescope find_files theme=dropdown<CR>', desc = 'Find Files' },
  { '<space>g', group = 'Git' },
  { '<space>gC', ':Telescope git_commits<CR>', desc = 'Commits' },
  { '<space>gS', ':Telescope git_stash<CR>', desc = 'Stash' },
  { '<space>gb', ':Telescope git_branches<CR>', desc = 'Branchs' },
  { '<space>gd', ':Gitsigns diffthis<CR>', desc = 'Open Diff' },
  { '<space>gg', ':LazyGit<CR>', desc = 'Open Lazygit' },
  { '<space>gp', ':Gitsigns preview_hunk_inline<CR>', desc = 'Open Inline Diff' },
  { '<space>gs', ':Telescope git_status<CR>', desc = 'Status' },
  { '<space>l', group = 'LSP' },
  {
    '<space>lb',
    vim.diagnostic.goto_next,
    desc = 'Jump previous Diagnostic',
  },
  { '<space>lc', vim.lsp.buf.code_action, desc = 'Code action' },
  { '<space>ld', vim.lsp.buf.declaration, desc = 'Go to Declaration' },
  { '<space>le', vim.diagnostic.open_float, desc = 'Show diagnostic' },
  { '<space>lf', vim.lsp.buf.format, desc = 'Format file' },
  { '<space>lh', vim.lsp.buf.hover, desc = 'Hover' },
  { '<space>li', vim.lsp.buf.implementation, desc = 'Go to Implementation' },
  { '<space>ll', ':LspRestart<CR>', desc = 'Lsp restart' },
  {
    '<space>ln',
    vim.diagnostic.goto_prev,
    desc = 'Jump next Diagnostic',
  },
  { '<space>lp', vim.lsp.buf.definition, desc = 'Go to Definition' },
  { '<space>lr', vim.lsp.buf.rename, desc = 'Rename' },
  { '<space>m', group = 'Markdown' },
  { '<space>mm', ':MarkdownPreview<CR>', desc = 'Open Markdown Preview' },
  { '<space>ms', ':MarkdownPreviewStop<CR>', desc = 'Stop Markdown Preview' },
  { '<space>mt', ':MarkdownPreviewToggle<CR>', desc = 'Toggle Markdown Preview' },
  { '<space>p', group = 'Plugins' },
  { '<space>pP', ':Lazy profile<CR>', desc = 'Open Profile' },
  { '<space>pc', ':Lazy clean<CR>', desc = 'Clean Plugins' },
  { '<space>pp', ':Lazy home<CR>', desc = 'Open Lazy' },
  { '<space>ps', ':Lazy sync<CR>', desc = 'Sync Plugins' },
  { '<space>pu', ':Lazy update<CR>', desc = 'Update Plugins' },
  { '<space>q', ':quit<CR>', desc = 'Close' },
  { '<space>s', group = 'Search' },
  { '<space>sH', ':Telescope highlights<CR>', desc = 'Search highlights' },
  { '<space>sb', ':Telescope buffers theme=cursor<CR>', desc = 'Search buffers' },
  { '<space>sc', ':Telescope commands<CR>', desc = 'Search commands' },
  { '<space>sf', ':Telescope find_files<CR>', desc = 'Search files' },
  { '<space>sh', ':Telescope help_tags<CR>', desc = 'Search Help Tags' },
  { '<space>sk', ':Telescope keymaps<CR>', desc = 'Search keymaps' },
  { '<space>sp', ':Telescope projects<CR>', desc = 'Search Projects' },
  { '<space>sw', ':Telescope live_grep<CR>', desc = 'Search words' },
  { '<space>t', ':ToggleTerm<CR>', desc = 'Open Terminal' },
  { '<space>w', ':update<CR>', desc = 'Save' },
}

M.visual = {
  {
    '<space>/',
    '<Plug>(comment_toggle_linewise_visual)',
    desc = 'Comment toggle current line',
    mode = 'v',
  },
}

return M
