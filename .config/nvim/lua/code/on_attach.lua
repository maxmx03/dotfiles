local function on_attach(client, bufnr)
  local lsp_signature = require 'lsp_signature'
  local wk = require 'which-key'

  if client and client.server_capabilities and client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true)
  end

  if client ~= nil and vim.tbl_contains({ 'null-ls' }, client.name) then
    return
  end

  lsp_signature.on_attach({
    floating_window = false,
    hint_prefix = '🤔' .. ' ',
    hint_scheme = 'String',
  }, bufnr)

  local outline = {
    {
      '<Leader>lo',
      '<cmd>Lspsaga outline<CR>',
      desc = 'Saga Outline',
    },
  }

  if vim.bo.filetype == 'html' then
    outline[1][2] = '<cmd>AerialToggle<CR>'
    outline[1].desc = 'Aerial Outline'
    wk.add(outline)
  else
    wk.add(outline)
  end
end

return on_attach
