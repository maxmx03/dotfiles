local keymap = require 'utils.keymap'
local quit = require 'utils.confirm-quit'
local nmap = keymap.nmap
local tmap = keymap.tmap
local vmap = keymap.vmap
local harpoon = require 'harpoon'

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
  require('nvim-window').pick()
end)
tmap('<ESC>', '<c-c> exit<CR>')
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")

local M = {}

M.normal = {
  {
    '<space>/',
    '<Plug>(comment_toggle_linewise_current)',
    desc = 'Comment toggle current line',
  },
  { '<space>e', ':Neotree toggle left reveal_force_cwd<CR>', desc = 'Open File Tree' },
  { '<space>f', ':Telescope find_files theme=dropdown<CR>', desc = 'Find Files' },
  { '<space>q', quit.confirm_quit, desc = 'Close' },
  { '<space>Q', ':quitall<CR>', desc = 'Quit Neovim' },
  { '<space>;', ':Dashboard<CR>', desc = 'Open Dashboard' },
  { '<space>t', ':ToggleTerm<CR>', desc = 'Open Terminal' },
  { '<space>w', ':update<CR>', desc = 'Save' },
  { '<space>m', group = 'Package manager' },
  { '<space>ma', '<cmd>MasonUninstallAll<cr>', desc = 'Uninstall all packages' },
  { '<space>mm', '<cmd>Mason<cr>', desc = 'Open Mason' },
  { '<space>mu', '<cmd>MasonUpdate<cr>', desc = 'Update Mason' },
  { '<space>b', group = 'Buffer' },
  { '<space>bX', ':BufferLineCloseOther <CR>', desc = 'Exit Others' },
  { '<space>bp', ':BufferLinePick <CR>', desc = 'Pick Buffer' },
  { '<space>bs', ':BufferLineSortByTabs <CR>', desc = 'Sortby Tabs' },
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
  { '<space>ls', ':Telescope lsp_document_symbols theme=cursor<CR>', desc = 'Document symbols' },
  { '<space>r', group = 'Markdown' },
  {
    '<space>rr',
    ':RenderMarkdown toggle<CR>',
    desc = 'Enable & disable markdown rendering',
  },
  {
    '<space>rm',
    ':MarkdownPreviewToggle<CR>',
    desc = 'Preview Markdown',
  },
  { '<space>p', group = 'Plugins' },
  { '<space>pP', ':Lazy profile<CR>', desc = 'Open Profile' },
  { '<space>pc', ':Lazy clean<CR>', desc = 'Clean Plugins' },
  { '<space>pp', ':Lazy home<CR>', desc = 'Open Lazy' },
  { '<space>ps', ':Lazy sync<CR>', desc = 'Sync Plugins' },
  { '<space>pu', ':Lazy update<CR>', desc = 'Update Plugins' },
  { '<space>s', group = 'Search' },
  { '<space>sH', ':Telescope highlights<CR>', desc = 'Search highlights' },
  { '<space>sb', ':Telescope buffers theme=cursor<CR>', desc = 'Search buffers' },
  { '<space>sc', ':Telescope commands<CR>', desc = 'Search commands' },
  { '<space>sf', ':Telescope find_files<CR>', desc = 'Search files' },
  { '<space>sh', ':Telescope help_tags<CR>', desc = 'Search Help Tags' },
  { '<space>sk', ':Telescope keymaps<CR>', desc = 'Search keymaps' },
  { '<space>sp', ':Telescope projects<CR>', desc = 'Search Projects' },
  { '<space>sw', ':Telescope live_grep<CR>', desc = 'Search words' },
  { '<space>h', group = 'Harpoon' },
  {
    '<space>ha',
    function()
      harpoon:list():append()
    end,
    desc = 'Mark file',
  },
  {
    '<space>hh',
    function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
    desc = 'Quick menu',
  },
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
