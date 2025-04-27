local winbar = require 'lib.winbar'
local au = vim.api.nvim_create_autocmd

au('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client.server_capabilities.inlayHintProvider then
      if vim.fn.expand '%:e' ~= 'vue' then
        vim.lsp.inlay_hint.enable(true)
      end
    end

    local lsp_signature = require 'lsp_signature'
    lsp_signature.on_attach({
      floating_window = false,
      hint_prefix = ' ',
      hint_scheme = 'String',
    }, bufnr)

    au('BufWritePost', {
      pattern = '*.*',
      callback = function()
        local ok, lint = pcall(require, 'lint')
        if not ok then
          return
        end
        lint.try_lint()
      end,
    })
    vim.o.winbar = winbar.get_winbar(client.name)
  end,
})

au('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

au('FileType', {
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

au('FileType', {
  pattern = 'go',
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = false
  end,
})

au('FileType', {
  pattern = 'python',
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})

au('BufWinEnter', {
  pattern = { '*.md' },
  callback = function()
    vim.opt.colorcolumn = '80'
    vim.opt.textwidth = 80
  end,
})

au({ 'BufWinLeave' }, {
  pattern = { '*.md' },
  callback = function()
    vim.opt.colorcolumn = '120'
    vim.opt.textwidth = 120
  end,
})

au({ 'BufWritePost' }, {
  pattern = { '*.spec.js', '*.test.js', '*.spec.ts', '*.test.ts' },
  callback = function()
    require('neotest').run.run(vim.fn.expand '%')
  end,
})
