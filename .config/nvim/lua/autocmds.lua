local au = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup('user_au_' .. name, { clear = true })
end

au('BufWinEnter', {
  group = augroup 'colorcolumn_80',
  pattern = { '*.md' },
  callback = function()
    vim.opt.colorcolumn = '80'
    vim.opt.textwidth = 80
  end,
})

au({ 'BufWinLeave' }, {
  group = augroup 'colorcolumn_120',
  pattern = { '*.md' },
  callback = function()
    vim.opt.colorcolumn = '120'
    vim.opt.textwidth = 120
  end,
})

au('TextYankPost', {
  group = augroup 'on_yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})

au('VimEnter', {
  group = augroup 'show_keys',
  once = true,
  callback = function()
    vim.defer_fn(function()
      require('showkeys').toggle()
    end, 3000)
  end,
})

au('VimEnter', {
  group = augroup 'on_docs',
  once = true,
  callback = function()
    vim.api.nvim_set_hl(0, 'HelpviewCode', { link = 'MarkviewCode' })
    vim.api.nvim_set_hl(0, 'HelpviewInlineCode', { link = 'MarkviewCode' })
  end,
})

au('LspAttach', {
  group = augroup 'on_attach',
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local lsp_signature = require 'lsp_signature'
    local icons = require 'utils.icons'

    if client and client.server_capabilities and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true)
    end

    if client ~= nil and vim.tbl_contains({ 'null-ls' }, client.name) then
      return
    end

    lsp_signature.on_attach({
      floating_window = false,
      hint_prefix = icons.ui.Comment .. ' ',
      hint_scheme = 'String',
    }, bufnr)
  end,
})

