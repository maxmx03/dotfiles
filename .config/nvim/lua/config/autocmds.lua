local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client:supports_method 'textDocument/inlayHint' then
      vim.lsp.inlay_hint.enable(true)
    end

    if client and client:supports_method 'textDocument/codeLens' then
      vim.lsp.codelens.refresh()
      vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
      })
    end

    if client and client:supports_method 'textDocument/documentHighlight' then
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

    local lsp_signature = require 'lsp_signature'
    lsp_signature.on_attach({
      floating_window = false,
      hint_prefix = ' ',
      hint_scheme = 'String',
    }, bufnr)
  end,
})

autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd('FileType', {
  pattern = {
    'javascript',
    'typescript',
    'html',
    'svelte',
    'javascriptreact',
    'typescriptreact',
    'css',
    'scss',
    'vue',
  },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})

autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = false
  end,
})

autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})

autocmd('FileType', {
  pattern = { 'markdown' },
  callback = function()
    vim.opt.colorcolumn = '80'
    vim.opt.textwidth = 80
  end,
})

autocmd({ 'BufWinLeave' }, {
  pattern = { '*.md' },
  callback = function()
    vim.opt.colorcolumn = '120'
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
