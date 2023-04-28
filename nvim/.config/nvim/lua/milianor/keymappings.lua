local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map('n', '<C-x>', '<cmd>lua require("mini.bufremove").delete()<cr>', opts)
map('n', '<C-Left>', "<cmd>lua require('mini.bracketed').buffer('backward')<cr>", opts)
map('n', '<C-Right>', "<cmd>lua require('mini.bracketed').buffer('forward')<cr>", opts)
map('v', '/', '<Plug>(comment_toggle_linewise_visual)', opts)
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)
map('n', 'ss', ':split<cr>', opts)
map('n', 'sv', ':vsplit<cr>', opts)
map('n', '<F7>', ':Inspect<cr>', opts)
map('n', '<F8>', ':InspectTree<cr>', opts)
map('n', '<Enter>', ':HopWord<cr>')

return {
  w = { '<cmd>update<cr>', '󰏫 Save' },
  q = { '<cmd>lua require("milianor.utils"):smart_quit()<cr>', ' Close' },
  Q = { '<cmd>quitall<cr>', '󰩈 Quit Neovim' },
  e = { '<cmd>NvimTreeToggle<cr>', '󰙅 Open File Tree' },
  f = { '<cmd>Telescope find_files<cr>', ' Find Files' },
  z = { '<cmd>ZenMode<cr>', '󱥸 Zen Mode' },
  t = { '<cmd>ToggleTerm<cr>', ' Open Terminal' },
  ['/'] = { '<Plug>(comment_toggle_linewise_current)', ' Comment toggle current line' },
  [';'] = { "<cmd>lua require('mini.starter').open()<cr>", ' Open Starter' },
  s = {
    name = ' Search',
    f = { '<cmd>Telescope find_files<cr>', 'Search files' },
    w = { '<cmd>Telescope live_grep<cr>', 'Search words' },
    b = { '<cmd>Telescope buffers<cr>', 'Search buffers' },
    h = { '<cmd>Telescope help_tags<cr>', 'Search Help Tags' },
    H = { '<cmd>Telescope highlights<cr>', 'Search highlights' },
    c = { '<cmd>Telescope commands<cr>', 'Search commands' },
    k = { '<cmd>Telescope keymaps<cr>', 'Search keymaps' },
  },
  g = {
    name = ' Git',
    d = { '<cmd>Gitsigns diffthis<cr>', 'Open Diff' },
    p = { '<cmd>Gitsigns preview_hunk_inline<cr>', 'Open Inline Diff' },
    C = { '<cmd>Telescope git_commits<cr>', 'Commits' },
    b = { '<cmd>Telescope git_branches<cr>', 'Branchs' },
    s = { '<cmd>Telescope git_status<cr>', 'Status' },
    S = { '<cmd>Telescope git_stash<cr>', 'Stash' },
  },
  G = {
    name = ' LazyGit',
    g = { '<cmd>LazyGitCurrentFile<cr>', 'Open Lazygit' },
    c = { '<cmd>LazyGitConfig<cr>', 'Open Configuration file' },
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
    name = ' Plugins',
    p = { '<cmd>Lazy home<cr>', 'Open Lazy' },
    P = { '<cmd>Lazy profile<cr>', 'Open Profile' },
    u = { '<cmd>Lazy update<cr>', 'Update Plugins' },
    c = { '<cmd>Lazy clean', 'Clean Plugins' },
    s = { '<cmd>Lazy sync<cr>', 'Sync Plugins' },
  },
  m = {
    name = ' Package manager',
    m = { '<cmd>Mason<cr>', ' Open Mason' },
    u = { '<cmd>MasonUpdate<cr>', 'Update Mason' },
    t = { '<cmd>MasonToolsUpdate<cr>', 'Update Mason Tools' },
    a = { '<cmd>MasonUninstallAll', 'Uninstall all packages' },
  },
  h = {
    name = '󰤇 Hop',
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
}
