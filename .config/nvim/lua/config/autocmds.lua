local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local lsp_signature = require 'lsp_signature'
    lsp_signature.on_attach({
      floating_window = false,
      hint_prefix = ' ',
      hint_scheme = 'LspInlayHint',
    }, bufnr)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    if client:supports_method 'textDocument/inlayHint' then
      vim.lsp.inlay_hint.enable(true)
    end

    if client:supports_method 'textDocument/codeLens' then
      vim.lsp.codelens.refresh()
      vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
      })
    end

    if client:supports_method 'textDocument/documentHighlight' then
      autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.document_highlight()
        end,
      })
      autocmd('CursorMoved', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.clear_references()
        end,
      })
    end

    if client:supports_method 'textDocument/documentSymbol' then
      local navic = require 'nvim-navic'
      navic.attach(client, bufnr)
      vim.o.winbar = "%t %{%v:lua.require'nvim-navic'.get_location()%}"
    end
  end,
})

autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd('BufWinEnter', {
  pattern = { '*.md' },
  callback = function()
    vim.opt.colorcolumn = '80'
    vim.opt.textwidth = 80
  end,
})

autocmd({ 'BufWinLeave' }, {
  pattern = { '*.md' },
  callback = function()
    vim.opt.colorcolumn = ''
    vim.opt.textwidth = 120
  end,
})

autocmd('Filetype', {
  pattern = { 'dashboard' },
  callback = function()
    vim.o.foldenable = false
  end,
  desc = 'Disable folding for dashboard',
})

autocmd('BufEnter', {
  pattern = { 'bash' },
  callback = function()
    vim.defer_fn(function()
      vim.cmd.startinsert()
    end, 0)
  end,
})
