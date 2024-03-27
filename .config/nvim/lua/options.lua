vim.loader.enable()
vim.g.mapleader = ' '      -- which-key
vim.g.maplocalleader = ']' -- neorg

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
opt.fillchars:append { eob = ' ' } -- remove endofbuffer characters
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.laststatus = 3
opt.list = true
opt.listchars:append { tab = '→ ' }
opt.mouse = 'a'
opt.number = true
opt.pumblend = 10         -- enables pseudo-transparency
opt.pumheight = 10        -- maximun number of items to show in the popup menu
opt.relativenumber = true -- number relative to the cursor
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append { W = true, I = true, c = true, C = true } -- noice.nvim
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = 'yes'
opt.showtabline = 2 -- specify when the tab will be displayed
opt.smartcase = true
opt.smartindent = true
opt.spell = false
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
opt.virtualedit = 'block' -- move cursor where there is not text in visual block mode
opt.wildmode = 'longest:full,full'
opt.winminwidth = 5
opt.wrap = false
opt.shell = 'bash'

if vim.fn.has 'nvim-0.10' == 1 then
  opt.smoothscroll = true
end

if vim.fn.has 'win32' == 1 then
  vim.cmd [[
  let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
  let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
  let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
  let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
  set shellquote= shellxquote=
  ]]
end

if vim.fn.has 'wsl' == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end
