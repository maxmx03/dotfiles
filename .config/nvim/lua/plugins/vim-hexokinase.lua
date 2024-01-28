return {
  {
    'rrethy/vim-hexokinase',
    build = 'make hexokinase',
    config = function()
      vim.g.Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
    end,
  },
}
