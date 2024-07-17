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
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)
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
  {
    '<space>/',
    '<Plug>(comment_toggle_linewise_current)',
    desc = 'Comment toggle current line',
  },
  { '<space>;',  ':Dashboard<Return>',         desc = 'Open Dashboard' },
  { '<space>M',  group = 'Package manager' },
  { '<space>Ma', '<cmd>MasonUninstallAll<cr>', desc = 'Uninstall all packages' },
  { '<space>Mm', '<cmd>Mason<cr>',             desc = 'Open Mason' },
  { '<space>Mt', '<cmd>MasonToolsUpdate<cr>',  desc = 'Update Mason Tools' },
  { '<space>Mu', '<cmd>MasonUpdate<cr>',       desc = 'Update Mason' },
  { '<space>Q',  ':quitall<Return>',           desc = 'Quit Neovim' },
  { '<space>T',  group = 'Todo' },
  {
    '<space>Tl',
    ':TodoLocList<Return>',
    desc = 'Show todos with loclist',
  },
  {
    '<space>Tn',
    ':TodoTelescope<Return>',
    desc = 'Show todos with telescope',
  },
  {
    '<space>Tq',
    ':TodoQuickFix<Return>',
    desc = 'Show todos with quickfix',
  },
  { '<space>b',  group = 'Buffer' },
  { '<space>bX', ':BufferLineCloseOther <Return>',                desc = 'Exit Others' },
  { '<space>bp', ':BufferLinePick <Return>',                      desc = 'Pick Buffer' },
  { '<space>bs', ':BufferLineSortByTabs <Return>',                desc = 'Sortby Tabs' },
  { '<space>c',  group = 'Codota' },
  { '<space>cd', ':TabnineDisable<Return>',                       desc = 'Tabnine disable' },
  { '<space>ce', ':TabnineEnable<Return>',                        desc = 'Tabnine enable' },
  { '<space>cl', ':TabnineLoginWithAuthToken<Return>',            desc = 'Tabnine login' },
  { '<space>cs', ':TabnineStatus<Return>',                        desc = 'Tabnine status' },
  { '<space>e',  ':Neotree toggle left reveal_force_cwd<Return>', desc = 'Open File Tree' },
  { '<space>f',  ':Telescope find_files theme=dropdown<Return>',  desc = 'Find Files' },
  { '<space>g',  group = 'Git' },
  { '<space>gC', ':Telescope git_commits<Return>',                desc = 'Commits' },
  { '<space>gS', ':Telescope git_stash<Return>',                  desc = 'Stash' },
  { '<space>gb', ':Telescope git_branches<Return>',               desc = 'Branchs' },
  { '<space>gd', ':Gitsigns diffthis<Return>',                    desc = 'Open Diff' },
  { '<space>gg', ':LazyGit<Return>',                              desc = 'Open Lazygit' },
  { '<space>gp', ':Gitsigns preview_hunk_inline<Return>',         desc = 'Open Inline Diff' },
  { '<space>gs', ':Telescope git_status<Return>',                 desc = 'Status' },
  { '<space>h',  group = 'Harpoon' },
  { '<space>ha', harpoon.append_list,                             desc = 'Mark file' },
  { '<space>hh', harpoon.quick_menu,                              desc = 'Quick menu' },
  { '<space>l',  group = 'LSP' },
  {
    '<space>lb',
    vim.diagnostic.get_prev,
    desc = 'Jump previous Diagnostic',
  },
  { '<space>lc', vim.lsp.buf.code_action,                   desc = 'Code action' },
  { '<space>ld', vim.lsp.buf.declaration,                   desc = 'Go to Declaration' },
  { '<space>le', vim.diagnostic.open_float,                 desc = 'Show diagnostic' },
  { '<space>lf', format,                                    desc = 'Format file' },
  { '<space>lh', vim.lsp.buf.hover,                         desc = 'Hover' },
  { '<space>li', vim.lsp.buf.implementation,                desc = 'Go to Implementation' },
  { '<space>ll', ':LspRestart<Return>',                     desc = 'Lsp restart' },
  { '<space>ln', vim.diagnostic.get_next,                   desc = 'Jump next Diagnostic' },
  { '<space>lp', vim.lsp.buf.definition,                    desc = 'Go to Definition' },
  { '<space>lr', vim.lsp.buf.rename,                        desc = 'Rename' },
  { '<space>m',  group = 'Markdown' },
  { '<space>mm', ':MarkdownPreview<Return>',                desc = 'Open Markdown Preview' },
  { '<space>ms', ':MarkdownPreviewStop<Return>',            desc = 'Stop Markdown Preview' },
  { '<space>mt', ':MarkdownPreviewToggle<Return>',          desc = 'Toggle Markdown Preview' },
  { '<space>p',  group = 'Plugins' },
  { '<space>pP', ':Lazy profile<Return>',                   desc = 'Open Profile' },
  { '<space>pc', ':Lazy clean<Return>',                     desc = 'Clean Plugins' },
  { '<space>pp', ':Lazy home<Return>',                      desc = 'Open Lazy' },
  { '<space>ps', ':Lazy sync<Return>',                      desc = 'Sync Plugins' },
  { '<space>pu', ':Lazy update<Return>',                    desc = 'Update Plugins' },
  { '<space>q',  quit,                                      desc = 'Close' },
  { '<space>s',  group = 'Search' },
  { '<space>sH', ':Telescope highlights<Return>',           desc = 'Search highlights' },
  { '<space>sb', ':Telescope buffers theme=cursor<Return>', desc = 'Search buffers' },
  { '<space>sc', ':Telescope commands<Return>',             desc = 'Search commands' },
  { '<space>sf', ':Telescope find_files<Return>',           desc = 'Search files' },
  { '<space>sh', ':Telescope help_tags<Return>',            desc = 'Search Help Tags' },
  { '<space>sk', ':Telescope keymaps<Return>',              desc = 'Search keymaps' },
  { '<space>sp', ':Telescope projects<Return>',             desc = 'Search Projects' },
  { '<space>sw', ':Telescope live_grep<Return>',            desc = 'Search words' },
  { '<space>t',  ':ToggleTerm direction=float<Return>',     desc = 'Open Terminal' },
  { '<space>w',  ':update<Return>',                         desc = 'Save' },
}

local visual = {
  {
    '<space>/',
    '<Plug>(comment_toggle_linewise_visual)',
    desc = 'Comment toggle current line',
    mode = 'v',
  },
}

return { normal = normal, visual = visual }
