return {
  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      local map = vim.keymap.set
      local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
      map('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
      map('i', '<c-j>', '<Plug>(coc-snippets-expand-jump)')
      map('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

      vim.g.coc_global_extensions = {
        'coc-vimlsp',
        'coc-prettier',
        'coc-html',
        'coc-eslint',
        'coc-emmet',
        'coc-tsserver',
        'coc-sumneko-lua',
        'coc-stylua',
        'coc-sh',
        'coc-pyright',
        'coc-json',
        'coc-css',
        'coc-angular',
        'coc-markdownlint',
        'coc-markdown-preview-enhanced',
        'coc-emoji',
      }
    end,
  },
}
