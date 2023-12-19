local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local utils = require 'milianor.utils'
local buffer = require('mini.bracketed').buffer

local mini = {
  forward = function()
    buffer 'forward'
  end,
  backward = function()
    buffer 'backward'
  end,
  first = function()
    buffer 'first'
  end,
  last = function()
    buffer 'last'
  end,
  delete = function()
    require('mini.bufremove').delete()
  end,
}

local milianor = {
  format = function()
    utils.format()
  end,
  quit = function()
    utils:smart_quit()
  end,
}

map('n', '<C-x>', mini.delete, opts)
map('n', '<C-Left>', ':BufferLineCyclePrev<Return>', opts)
map('n', '<C-Right>', ':BufferLineCycleNext<Return>', opts)
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)
map('n', 'ss', ':split<Return>', opts)
map('n', 'sv', ':vsplit<Return>', opts)
map('n', '<F7>', ':Inspect<Return>', opts)
map('n', '<F8>', ':InspectTree<Return>', opts)

local normal = {
  ['w'] = { ':update<Return>', ' Save' },
  q = { milianor.quit, ' Close' },
  Q = { ':quitall<Return>', '󰩈 Quit Neovim' },
  e = { ':NvimTreeToggle<Return>', '󰙅 Open File Tree' },
  f = { ':Telescope find_files<Return>', ' Find Files' },
  z = {
    function()
      vim.api.nvim_command 'ZenMode'
      vim.api.nvim_command 'Solarized zen'
    end,
    '󱥸 Zen Mode',
  },
  t = { ':ToggleTerm direction=horizontal<Return>', ' Open Terminal' },
  ['/'] = { '<Plug>(comment_toggle_linewise_current)', ' Comment toggle current line' },
  [';'] = { ':Dashboard<Return>', ' Open Dashboard' },
  s = {
    name = ' Search',
    f = { ':Telescope find_files<Return>', 'Search files' },
    w = { ':Telescope live_grep<Return>', 'Search words' },
    b = { ':Telescope buffers<Return>', 'Search buffers' },
    h = { ':Telescope help_tags<Return>', 'Search Help Tags' },
    H = { ':Telescope highlights<Return>', 'Search highlights' },
    c = { ':Telescope commands<Return>', 'Search commands' },
    k = { ':Telescope keymaps<Return>', 'Search keymaps' },
    p = { ':Telescope projects<Return>', 'Search Projects' },
  },
  l = {
    name = ' LSP',
    l = { ':LspRestart<Return>', 'Lsp restart' },
    d = { ':Lspsaga goto_definition<Return>', 'Go to Definition' },
    p = { ':Lspsaga peek_definition<Return>', 'Peek Definition' },
    h = { ':Lspsaga hover_doc<Return>', 'Hover' },
    s = { ':Telescope lsp_document_symbols theme=dropdown<Return>', 'Document Symbols' },
    r = { ':Lspsaga rename<Return>', 'Rename' },
    c = { ':Lspsaga code_action<Return>', 'Code action' },
    f = { milianor.format, 'Format file' },
    e = { ':Lspsaga show_buf_diagnostics<Return>', 'Show diagnostic' },
    o = { ':Lspsaga outline<Return>', 'Show outline' },
    n = { ':Lspsaga diagnostic_jump_next<Return>', 'Jump next Diagnostic' },
    b = { ':Lspsaga diagnostic_jump_prev<Return>', 'Jump previous Diagnostic' },
    t = { ':TSC<Return>', 'Type-checking for typescript' },
  },
  g = {
    name = ' Git',
    d = { ':Gitsigns diffthis<Return>', 'Open Diff' },
    p = { ':Gitsigns preview_hunk_inline<Return>', 'Open Inline Diff' },
    g = { ':Neogit kind=floating<Return>', 'Open Neogit' },
    l = { ':LazyGit<Return>', 'Open Lazygit' },
    C = { ':Telescope git_commits<Return>', 'Commits' },
    b = { ':Telescope git_branches<Return>', 'Branchs' },
    s = { ':Telescope git_status<Return>', 'Status' },
    S = { ':Telescope git_stash<Return>', 'Stash' },
  },
  b = {
    name = ' Buffer',
    n = { mini.forward, 'Move to Next buffer' },
    b = { mini.backward, 'Move to Prev buffer' },
    f = { mini.first, 'Move to First buffer' },
    l = { mini.last, 'Move to Last buffer' },
    x = { mini.delete, 'Exit buffer' },
    p = { ':BufferLinePick <Return>', 'Pick Buffer' },
    X = { ':BufferLineCloseOther <Return>', 'Exit Others' },
    s = { ':BufferLineSortByTabs <Return>', 'Exit Others' },
  },
  p = {
    name = ' Plugins',
    p = { ':Lazy home<Return>', 'Open Lazy' },
    P = { ':Lazy profile<Return>', 'Open Profile' },
    u = { ':Lazy update<Return>', 'Update Plugins' },
    c = { ':Lazy clean', 'Clean Plugins' },
    s = { ':Lazy sync<Return>', 'Sync Plugins' },
  },
  M = {
    name = ' Package manager',
    m = { ':Mason<Return>', 'Open Mason' },
    u = { ':MasonUpdate<Return>', 'Update Mason' },
    t = { ':MasonToolsUpdate<Return>', 'Update Mason Tools' },
    a = { ':MasonUninstallAll<Return>', 'Uninstall all packages' },
  },
  h = {
    name = '󰤇 Hop',
    h = { ':HopAnywhere<Return>', 'Hop Anywere' },
    w = { ':HopWord<Return>', 'Hop Word' },
    W = { ':HopWordCurrentLine<Return>', 'Hop Word Current Line' },
    a = { ':HopAnywhere<Return>', 'Hop Anywhere' },
    A = { ':HopAnywhereCurrentLine<Return>', 'Hop Anywhere Current Line' },
    c = { ':HopChar2<Return>', 'Hop Char' },
    C = { ':HopChar2CurrentLine<Return>', 'Hop Char Current Line' },
    p = { ':HopPattern<Return>', 'Hop Pattern' },
    P = { ':HopPatternCurrentLine<Return>', 'Hop Pattern Current Line' },
    l = { ':HopLineStart<Return>', 'Hop Line Start' },
    L = { ':HopLine<Return>', 'Hop Line' },
    v = { ':HopVertical<Return>', 'Hop Vertical' },
  },
  c = {
    name = '󰚩 Codota',
    e = { ':TabnineEnable<Return>', 'Tabnine enable' },
    d = { ':TabnineDisable<Return>', 'Tabnine disable' },
    s = { ':TabnineStatus<Return>', 'Tabnine status' },
    l = { ':TabnineLoginWithAuthToken<Return>', 'Tabnine login' },
  },
  m = {
    name = ' Markdown',
    m = { ':MarkdownPreview<Return>', 'Open Markdown Preview' },
    s = { ':MarkdownPreviewStop<Return>', 'Stop Markdown Preview' },
    t = { ':MarkdownPreviewToggle<Return>', 'Toggle Markdown Preview' },
  },
  n = {
    name = ' Todo and Trouble',
    n = { ':TodoTelescope<Return>', 'Show todos with telescope' },
    q = { ':TodoQuickFix<Return>', 'Show todos with quickfix' },
    l = { ':TodoLocList<Return>', 'Show todos with loclist' },
    t = { ':Trouble workspace_diagnostics<Return>', 'Show trouble' },
  },
}

local visual = {
  ['/'] = { '<Plug>(comment_toggle_linewise_visual)', ' Comment toggle current line' },
}

return { normal = normal, visual = visual }
