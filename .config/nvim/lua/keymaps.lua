local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local quit = require 'core.quit'

map('n', '<C-x>', ':bd<Return>', opts)
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
  q = { quit, ' Close' },
  Q = { ':quitall<Return>', '󰩈 Quit Neovim' },
  e = { ':NvimTreeToggle<Return>', '󰙅 Open File Tree' },
  f = { ':Telescope find_files<Return>', ' Find Files' },
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
    b = { ':Telescope buffers<Return>', 'Search buffers' },
    h = { ':Telescope help_tags<Return>', 'Search Help Tags' },
    H = { ':Telescope highlights<Return>', 'Search highlights' },
    c = { ':Telescope commands<Return>', 'Search commands' },
    k = { ':Telescope keymaps<Return>', 'Search keymaps' },
    p = { ':Telescope projects<Return>', 'Search Projects' },
  },
  l = {
    name = ' Coc',
    f = { '<Plug>(coc-format-selected)', 'format code' },
    n = { '<Plug>(coc-diagnostic-next)', 'diagnostic next' },
    N = { '<Plug>(coc-diagnostic-prev)', 'diagnostic prev' },
    d = { '<Plug>(coc-definition)', 'defition' },
    i = { '<Plug>(coc-implementation)', 'implementation' },
    r = { '<Plug>(coc-reference)', 'reference' },
    h = { ':call CocActionAsync("doHover")', 'show docs' },
    a = { '<Plug>(coc-codeaction-cursor)', 'code action' },
    l = { '<Plug>(coc-codelens-action)', 'code lens action' },
    c = { '<Plug>(coc-fix-current)', 'fix diagnostic' },
  },
  g = {
    name = ' Git',
    d = { ':Gitsigns diffthis<Return>', 'Open Diff' },
    p = { ':Gitsigns preview_hunk_inline<Return>', 'Open Inline Diff' },
    l = { ':LazyGit<Return>', 'Open Lazygit' },
    C = { ':Telescope git_commits<Return>', 'Commits' },
    b = { ':Telescope git_branches<Return>', 'Branchs' },
    s = { ':Telescope git_status<Return>', 'Status' },
    S = { ':Telescope git_stash<Return>', 'Stash' },
  },
  b = {
    name = ' Buffer',
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
  m = {
    name = ' Markdown',
    m = { ':CocCommand markdown-preview-enhanced.openPreview', 'Open Markdown Preview' },
  },
  n = {
    name = ' Neorg',
    w = { ':Neorg workspace notes<Return>', 'Open Workspace' },
    u = { ':Neorg upgrade<Return>', 'Upgrade Neorg' },
  }
}

local visual = {
  ['/'] = {
    '<Plug>(comment_toggle_linewise_visual)',
    ' Comment toggle current line',
  },
}

return { normal = normal, visual = visual }
