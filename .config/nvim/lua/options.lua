vim.loader.enable()
vim.g.base46_cache = vim.fn.stdpath 'data' .. '/base46_cache/'
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.g.editorconfig = true

local opt = vim.opt

opt.autowrite = true
opt.autowriteall = true
opt.clipboard = 'unnamedplus'
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 3
opt.confirm = true
opt.cursorline = true
opt.colorcolumn = '120'
opt.expandtab = true
opt.formatoptions = 'jcroqlnt'
opt.fillchars:append { eob = ' ' }
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.laststatus = 3
opt.list = true
opt.listchars:append { tab = '→ ' }
opt.mouse = 'a'
opt.number = true
-- opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = 'yes'
opt.showtabline = 2
opt.smartcase = true
opt.smartindent = true
opt.spell = true
opt.spelllang = { 'en', 'pt_br' }
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 600
opt.textwidth = 120
opt.undofile = true
opt.undodir = vim.fn.stdpath 'cache' .. '/undo'
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = 'block'
opt.wildmode = 'longest:full,full'
opt.winminwidth = 5
opt.wrap = true
opt.smoothscroll = true
opt.title = true
