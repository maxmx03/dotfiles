local function format()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.buf.format { bufnr = bufnr, async = false }
end

return format
