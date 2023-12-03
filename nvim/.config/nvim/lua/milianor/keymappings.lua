local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map('n', '<C-x>', '<cmd>lua require("mini.bufremove").delete()<cr>', opts)
map('n', '<C-Left>', "<cmd>lua require('mini.bracketed').buffer('backward')<cr>", opts)
map('n', '<C-Right>', "<cmd>lua require('mini.bracketed').buffer('forward')<cr>", opts)
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)
map('n', 'ss', ':split<cr>', opts)
map('n', 'sv', ':vsplit<cr>', opts)
map('n', '<F7>', ':Inspect<cr>', opts)
map('n', '<F8>', ':InspectTree<cr>', opts)

local normal = {
  w = { '<cmd>update<cr>', '󰏫 Save' },
  q = { '<cmd>lua require("milianor.utils"):smart_quit()<cr>', ' Close' },
  Q = { '<cmd>quitall<cr>', '󰩈 Quit Neovim' },
  e = { '<cmd>NvimTreeToggle<cr>', '󰙅 Open File Tree' },
  f = { '<cmd>Telescope find_files<cr>', ' Find Files' },
  z = { '<cmd>ZenMode<cr>', '󱥸 Zen Mode' },
  t = { '<cmd>ToggleTerm<cr>', ' Open Terminal' },
  ['/'] = { '<Plug>(comment_toggle_linewise_current)', ' Comment toggle current line' },
  [';'] = { '<cmd>Dashboard<cr>', ' Open Dashboard' },
  s = {
    name = ' Search',
    f = { '<cmd>Telescope find_files<cr>', 'Search files' },
    w = { '<cmd>Telescope live_grep<cr>', 'Search words' },
    b = { '<cmd>Telescope buffers<cr>', 'Search buffers' },
    h = { '<cmd>Telescope help_tags<cr>', 'Search Help Tags' },
    H = { '<cmd>Telescope highlights<cr>', 'Search highlights' },
    c = { '<cmd>Telescope commands<cr>', 'Search commands' },
    k = { '<cmd>Telescope keymaps<cr>', 'Search keymaps' },
    p = { '<cmd>Telescope projects<cr>', 'Search Projects' },
  },
  g = {
    name = ' Git',
    d = { '<cmd>Gitsigns diffthis<cr>', 'Open Diff' },
    p = { '<cmd>Gitsigns preview_hunk_inline<cr>', 'Open Inline Diff' },
    g = { '<cmd>Neogit kind=floating<cr>', 'Open Neogit' },
    l = { '<cmd>LazyGit<cr>', 'Open Lazygit' },
    C = { '<cmd>Telescope git_commits<cr>', 'Commits' },
    b = { '<cmd>Telescope git_branches<cr>', 'Branchs' },
    s = { '<cmd>Telescope git_status<cr>', 'Status' },
    S = { '<cmd>Telescope git_stash<cr>', 'Stash' },
  },
  b = {
    name = ' Buffer',
    b = { "<cmd>lua require('mini.bracketed').buffer('forward')<cr>", 'Move to Next buffer' },
    p = { "<cmd>lua require('mini.bracketed').buffer('backward')<cr>", 'Move to Prev buffer' },
    f = { "<cmd>lua require('mini.bracketed').buffer('first')<cr>", 'Move to First buffer' },
    l = { "<cmd>lua require('mini.bracketed').buffer('last')<cr>", 'Move to Last buffer' },
    x = { "<cmd>lua require('mini.bufremove').delete()<cr>", 'Exit buffer' },
  },
  p = {
    name = ' Plugins',
    p = { '<cmd>Lazy home<cr>', 'Open Lazy' },
    P = { '<cmd>Lazy profile<cr>', 'Open Profile' },
    u = { '<cmd>Lazy update<cr>', 'Update Plugins' },
    c = { '<cmd>Lazy clean', 'Clean Plugins' },
    s = { '<cmd>Lazy sync<cr>', 'Sync Plugins' },
  },
  M = {
    name = ' Package manager',
    m = { '<cmd>Mason<cr>', 'Open Mason' },
    u = { '<cmd>MasonUpdate<cr>', 'Update Mason' },
    t = { '<cmd>MasonToolsUpdate<cr>', 'Update Mason Tools' },
    a = { '<cmd>MasonUninstallAll<cr>', 'Uninstall all packages' },
  },
  h = {
    name = '󰤇 Hop',
    h = { '<cmd>HopAnywhere<cr>', 'Hop Anywere' },
    w = { '<cmd>HopWord<cr>', 'Hop Word' },
    W = { '<cmd>HopWordCurrentLine<cr>', 'Hop Word Current Line' },
    a = { '<cmd>HopAnywhere<cr>', 'Hop Anywhere' },
    A = { '<cmd>HopAnywhereCurrentLine<cr>', 'Hop Anywhere Current Line' },
    c = { '<cmd>HopChar2<cr>', 'Hop Char' },
    C = { '<cmd>HopChar2CurrentLine<cr>', 'Hop Char Current Line' },
    p = { '<cmd>HopPattern<cr>', 'Hop Pattern' },
    P = { '<cmd>HopPatternCurrentLine<cr>', 'Hop Pattern Current Line' },
    l = { '<cmd>HopLineStart<cr>', 'Hop Line Start' },
    L = { '<cmd>HopLine<cr>', 'Hop Line' },
    v = { '<cmd>HopVertical<cr>', 'Hop Vertical' },
  },
  c = {
    name = '󰚩 Codota',
    e = { '<cmd>TabnineEnable<cr>', 'Tabnine enable' },
    d = { '<cmd>TabnineDisable<cr>', 'Tabnine disable' },
    s = { '<cmd>TabnineStatus<cr>', 'Tabnine status' },
    l = { '<cmd>TabnineLoginWithAuthToken<cr>', 'Tabnine login' },
  },
  o = {
    name = '󰚩 Ollama',
    c = { '<cmd>Gen Chat<cr>', 'Chat' },
    a = { '<cmd>Gen Ask<cr>', 'Ask' },
  }
}

local visual = {
  ['/'] = { '<Plug>(comment_toggle_linewise_visual)', ' Comment toggle current line' },
  o = {
    name = '󰚩 Ollama',
    c = { ':Gen Enhance_Code<cr>', 'Enhance Code' },
    r = { ':Gen Review_Code<cr>', 'Review Code' },
  },
}

return { normal = normal, visual = visual }
