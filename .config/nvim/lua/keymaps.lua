local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local quit = require 'core.quit'
local format = require 'core.format'
local pick_window = require 'core.pick-window'
local harpoon = require 'core.harpoon'

--- Normal
map('n', '<C-x>', ':bd<Return>', opts)
map('n', '<C-Left>', ':BufferLineCyclePrev<Return>', opts)
map('n', '<C-Right>', ':BufferLineCycleNext<Return>', opts)
map('n', '+', '^ylp', opts)
map('n', '-', '^x', opts)
map('n', 'ss', ':split<Return>', opts)
map('n', 'sv', ':vsplit<Return>', opts)
map('n', '<F7>', ':Inspect<Return>', opts)
map('n', '<F8>', ':InspectTree<Return>', opts)
map('n', 'f', '=<CR>', opts)
map('n', 'F', '=G<CR>', opts)
map('n', 's', ':HopWord<Return>', opts)
map('n', '<Tab>', pick_window, opts)
if vim.fn.has 'wsl' == 1 then
  map('n', '<C-t>', '<C-]>', opts)
end

-- Terminal
map('t', '<ESC>', '<c-c> exit<CR>', opts)

-- Visual
map('v', '<C-Up>', ":m '<-2<CR>gv=gv")
map('v', '<C-Down>', ":m '>+1<CR>gv=gv")

local normal = {
  ['w'] = { ':update<Return>', ' Save' },
  q = { quit, ' Close' },
  Q = { ':quitall<Return>', '󰩈 Quit Neovim' },
  e = { ':Neotree toggle<Return>', '󰙅 Open File Tree' },
  f = { ':Telescope find_files theme=dropdown<Return>', ' Find Files' },
  t = { ':ToggleTerm direction=float<Return>', ' Open Terminal' },
  ['/'] = {
    '<Plug>(comment_toggle_linewise_current)',
    ' Comment toggle current line',
  },
  [';'] = { ':Dashboard<Return>', ' Open Dashboard' },
  s = {
    name = ' Search',
    f = { ':Telescope find_files<Return>', 'Search files' },
    w = { ':Telescope live_grep<Return>', 'Search words' },
    b = { ':Telescope buffers theme=cursor<Return>', 'Search buffers' },
    h = { ':Telescope help_tags<Return>', 'Search Help Tags' },
    H = { ':Telescope highlights<Return>', 'Search highlights' },
    c = { ':Telescope commands<Return>', 'Search commands' },
    k = { ':Telescope keymaps<Return>', 'Search keymaps' },
    p = { ':Telescope projects<Return>', 'Search Projects' },
  },
  l = {
    name = ' LSP',
    l = { ':LspRestart<Return>', 'Lsp restart' },
    d = { vim.lsp.buf.declaration, 'Go to Declaration' },
    p = { vim.lsp.buf.definition, 'Go to Definition' },
    i = { vim.lsp.buf.implementation, 'Go to Implementation' },
    h = { vim.lsp.buf.hover, 'Hover' },
    r = { vim.lsp.buf.rename, 'Rename' },
    c = { vim.lsp.buf.code_action, 'Code action' },
    f = { format, 'Format file' },
    e = { vim.diagnostic.open_float, 'Show diagnostic' },
    n = { vim.diagnostic.goto_next, 'Jump next Diagnostic' },
    b = { vim.diagnostic.goto_prev, 'Jump previous Diagnostic' },
  },
  g = {
    name = ' Git',
    g = { ':LazyGit<Return>', 'Open Lazygit' },
    d = { ':Gitsigns diffthis<Return>', 'Open Diff' },
    p = { ':Gitsigns preview_hunk_inline<Return>', 'Open Inline Diff' },
    C = { ':Telescope git_commits<Return>', 'Commits' },
    b = { ':Telescope git_branches<Return>', 'Branchs' },
    s = { ':Telescope git_status<Return>', 'Status' },
    S = { ':Telescope git_stash<Return>', 'Stash' },
  },
  b = {
    name = ' Buffer',
    p = { ':BufferLinePick <Return>', 'Pick Buffer' },
    X = { ':BufferLineCloseOther <Return>', 'Exit Others' },
    s = { ':BufferLineSortByTabs <Return>', 'Sortby Tabs' },
  },
  p = {
    name = ' Plugins',
    p = { ':Lazy home<Return>', 'Open Lazy' },
    P = { ':Lazy profile<Return>', 'Open Profile' },
    u = { ':Lazy update<Return>', 'Update Plugins' },
    c = { ':Lazy clean<Return>', 'Clean Plugins' },
    s = { ':Lazy sync<Return>', 'Sync Plugins' },
  },
  h = {
    name = '󱡅 Harpoon',
    h = { harpoon.quick_menu, 'Quick menu' },
    a = { harpoon.append_list, 'Mark file' },
  },
  m = {
    name = ' Markdown',
    m = { ':MarkdownPreview<Return>', 'Open Markdown Preview' },
    s = { ':MarkdownPreviewStop<Return>', 'Stop Markdown Preview' },
    t = { ':MarkdownPreviewToggle<Return>', 'Toggle Markdown Preview' },
  },
  M = {
    name = ' Package manager',
    m = { '<cmd>Mason<cr>', 'Open Mason' },
    u = { '<cmd>MasonUpdate<cr>', 'Update Mason' },
    t = { '<cmd>MasonToolsUpdate<cr>', 'Update Mason Tools' },
    a = { '<cmd>MasonUninstallAll<cr>', 'Uninstall all packages' },
  },
  n = {
    name = ' Neorg',
    w = { ':Neorg workspace notes<Return>', 'Open Workspace' },
    u = { ':Neorg upgrade<Return>', 'Upgrade Neorg' },
    r = { ':Neorg return<Return>', 'Return' },
  },
  c = {
    name = '󰚩 Codota',
    e = { ':TabnineEnable<Return>', 'Tabnine enable' },
    d = { ':TabnineDisable<Return>', 'Tabnine disable' },
    s = { ':TabnineStatus<Return>', 'Tabnine status' },
    l = { ':TabnineLoginWithAuthToken<Return>', 'Tabnine login' },
  },
  T = {
    name = ' Todo',
    n = { ':TodoTelescope<Return>', 'Show todos with telescope' },
    q = { ':TodoQuickFix<Return>', 'Show todos with quickfix' },
    l = { ':TodoLocList<Return>', 'Show todos with loclist' },
  },
}

local visual = {
  ['/'] = {
    '<Plug>(comment_toggle_linewise_visual)',
    ' Comment toggle current line',
  },
}

return { normal = normal, visual = visual }
