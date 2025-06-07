return {
  'hiphish/rainbow-delimiters.nvim',
  config = function()
    ---@type rainbow_delimiters.config
    vim.g.rainbow_delimiters = {
      whitelist = {
        'clojure',
        'fennel',
        'commonlisp',
        'query',
      },
      strategy = {
        clojure = 'rainbow-delimiters.strategy.local',
        fennel = 'rainbow-delimiters.strategy.local',
        commonlisp = 'rainbow-delimiters.strategy.local',
        query = 'rainbow-delimiters.strategy.local',
      },
      highlight = {
        'RainbowDelimiterBlue',
        'RainbowDelimiterCyan',
        'RainbowDelimiterYellow',
        'RainbowDelimiterRed',
        'RainbowDelimiterViolet',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
      },
    }
  end,
}
