local keymap = require 'utils.keymap'
local quit = require 'utils.confirm-quit'
local nmap = keymap.nmap
local tmap = keymap.tmap
local vmap = keymap.vmap
local harpoon = require 'harpoon'

nmap('<Space>', '<Nop>')
nmap('<C-x>', '<cmd>bd<CR>')
nmap('+', '<C-a>')
nmap('-', '<C-x>')
nmap('ss', '<cmd>split<CR>')
nmap('sv', '<cmd>vsplit<CR>')
nmap('<F7>', '<cmd>Inspect<CR>')
nmap('<F8>', '<cmd>InspectTree<CR>')
nmap('f', '=<CR>')
nmap('F', '=G<CR>')
nmap('s', '<cmd>HopWord<CR>')
nmap('<C-Left>', '<cmd>BufferLineCyclePrev<CR>')
nmap('<C-Right>', '<cmd>BufferLineCycleNext<CR>')
nmap('<Tab>', function()
  require('nvim-window').pick()
end)
tmap('<ESC>', '<c-c> exit<CR>')
vmap('J', "<cmd>m '>+1<CR>gv=gv")
vmap('K', "<cmd>m '<-2<CR>gv=gv")

return {
  {
    '<space>/',
    '<Plug>(comment_toggle_linewise_visual)',
    desc = 'Comment toggle current line',
    mode = 'v',
  },
  {
    '<space>/',
    '<Plug>(comment_toggle_linewise_current)',
    desc = 'Comment toggle current line',
  },
  { '<space>e',  '<cmd>Neotree toggle left reveal_force_cwd<CR>', desc = 'Open File Tree' },
  { '<space>f',  '<cmd>Telescope find_files theme=dropdown<CR>',  desc = 'Find Files' },
  { '<space>q',  quit.confirm_quit,                               desc = 'Close' },
  { '<space>Q',  '<cmd>quitall<CR>',                              desc = 'Quit Neovim' },
  { '<space>;',  '<cmd>Dashboard<CR>',                            desc = 'Open Dashboard' },
  { '<space>w',  '<cmd>update<CR>',                               desc = 'Save' },
  { '<space>m',  group = 'Package manager' },
  { '<space>ma', '<cmd>MasonUninstallAll<CR>',                    desc = 'Uninstall all packages' },
  { '<space>mm', '<cmd>Mason<CR>',                                desc = 'Open Mason' },
  { '<space>mu', '<cmd>MasonUpdate<CR>',                          desc = 'Update Mason' },
  { '<space>b',  group = 'Buffer' },
  { '<space>bX', '<cmd>BufferLineCloseOther <CR>',                desc = 'Exit Others' },
  { '<space>bp', '<cmd>BufferLinePick <CR>',                      desc = 'Pick Buffer' },
  { '<space>bs', '<cmd>BufferLineSortByTabs <CR>',                desc = 'Sortby Tabs' },
  { '<space>g',  group = 'Git' },
  { '<space>gC', '<cmd>Telescope git_commits<CR>',                desc = 'Commits' },
  { '<space>gS', '<cmd>Telescope git_stash<CR>',                  desc = 'Stash' },
  { '<space>gb', '<cmd>Telescope git_branches<CR>',               desc = 'Branchs' },
  { '<space>gd', '<cmd>Gitsigns diffthis<CR>',                    desc = 'Open Diff' },
  { '<space>gg', '<cmd>LazyGit<CR>',                              desc = 'Open Lazygit' },
  { '<space>gp', '<cmd>Gitsigns preview_hunk_inline<CR>',         desc = 'Open Inline Diff' },
  { '<space>gs', '<cmd>Telescope git_status<CR>',                 desc = 'Status' },
  { '<space>l',  group = 'LSP' },
  {
    '<space>lb',
    '<cmd>Lspsaga diagnostic_jump_prev<CR>',
    desc = 'Jump previous Diagnostic',
  },
  { '<space>lc', '<cmd>Lspsaga code_action<CR>',          desc = 'Code action' },
  { '<space>ld', '<cmd>Lspsaga goto_definition<CR>',      desc = 'Go to Definition' },
  { '<space>le', '<cmd>Lspsaga show_buf_diagnostics<CR>', desc = 'Show diagnostic' },
  { '<space>lf', '<cmd>LspZeroFormat<CR>',                desc = 'Format file' },
  { '<space>lh', '<cmd>Lspsaga hover_doc<CR>',            desc = 'Hover' },
  { '<space>ll', '<cmd>LspRestart<CR>',                   desc = 'Lsp restart' },
  {
    '<space>ln',
    '<cmd>Lspsaga diagnostic_jump_next<CR>',
    desc = 'Jump next Diagnostic',
  },
  { '<space>lp', '<cmd>Lspsaga peek_definition<CR>', desc = 'Peek Definition' },
  { '<space>lr', '<cmd>Lspsaga rename<CR>',          desc = 'Rename' },
  {
    '<space>lR',
    '<cmd>Lspsaga project_replace<CR>',
    desc = 'Project Replace',
  },
  {
    '<space>ls',
    '<cmd>Telescope lsp_document_symbols theme=cursor<CR>',
    desc = 'Document symbols',
  },
  { '<space>r',  group = 'Markdown' },
  {
    '<space>rr',
    '<cmd>RenderMarkdown toggle<CR>',
    desc = 'Enable & disable markdown rendering',
  },
  {
    '<space>rm',
    '<cmd>MarkdownPreviewToggle<CR>',
    desc = 'Preview Markdown',
  },
  {
    '<leader>rp',
    '<cmd>PasteImage<CR>',
    desc = 'Paste image from system clipboard',
  },
  { '<space>p',  group = 'Plugins' },
  { '<space>pP', '<cmd>Lazy profile<CR>',                   desc = 'Open Profile' },
  { '<space>pc', '<cmd>Lazy clean<CR>',                     desc = 'Clean Plugins' },
  { '<space>pp', '<cmd>Lazy home<CR>',                      desc = 'Open Lazy' },
  { '<space>ps', '<cmd>Lazy sync<CR>',                      desc = 'Sync Plugins' },
  { '<space>pu', '<cmd>Lazy update<CR>',                    desc = 'Update Plugins' },
  { '<space>s',  group = 'Search' },
  { '<space>sH', '<cmd>Telescope highlights<CR>',           desc = 'Search highlights' },
  { '<space>sb', '<cmd>Telescope buffers theme=cursor<CR>', desc = 'Search buffers' },
  { '<space>sc', '<cmd>Telescope commands<CR>',             desc = 'Search commands' },
  { '<space>sf', '<cmd>Telescope find_files<CR>',           desc = 'Search files' },
  { '<space>sh', '<cmd>Telescope help_tags<CR>',            desc = 'Search Help Tags' },
  { '<space>sk', '<cmd>Telescope keymaps<CR>',              desc = 'Search keymaps' },
  { '<space>sp', '<cmd>Telescope projects<CR>',             desc = 'Search Projects' },
  { '<space>sw', '<cmd>Telescope live_grep<CR>',            desc = 'Search words' },
  { '<space>h',  group = 'Harpoon' },
  {
    '<space>ha',
    function()
      harpoon:list():add()
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
