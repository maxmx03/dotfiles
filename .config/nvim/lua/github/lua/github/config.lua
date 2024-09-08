---@class github.transparent
---@field normal? boolean
---@field normalfloat? boolean
---@field pmenu? boolean
---@field neotree? boolean
---@field nvimtree? boolean
---@field telescope? boolean
---@field whichkey? boolean
---@field lazy? boolean
---@field mason? boolean
---@field enabled? boolean

---@class github.styles
---@field types? vim.api.keyset.highlight
---@field functions? vim.api.keyset.highlight
---@field parameters? vim.api.keyset.highlight
---@field comments? vim.api.keyset.highlight
---@field strings? vim.api.keyset.highlight
---@field keywords? vim.api.keyset.highlight
---@field variables? vim.api.keyset.highlight
---@field constants? vim.api.keyset.highlight
---@field statements? vim.api.keyset.highlight

---@class github.plugins
---@field treesitter? boolean
---@field lspconfig? boolean
---@field navic? boolean
---@field cmp? boolean
---@field indentblankline? boolean
---@field neotree? boolean
---@field nvimtree? boolean
---@field whichkey? boolean
---@field dashboard? boolean
---@field gitsigns? boolean
---@field telescope? boolean
---@field noice? boolean
---@field hop? boolean
---@field ministatusline? boolean
---@field minitabline? boolean
---@field ministarter? boolean
---@field minicursorword? boolean
---@field notify? boolean
---@field rainbowdelimiters? boolean
---@field bufferline? boolean
---@field lazy? boolean
---@field rendermarkdown? boolean
---@field neogit? boolean
---@field todocomments? boolean
---@field ale? boolean
---@field alpha? boolean
---@field yanky? boolean
---@field gitgutter? boolean
---@field coc? boolean
---@field leap? boolean
---@field mason? boolean

---@class github.error_lens
---@field text? boolean
---@field symbol? boolean

---@class github.config
---@field transparent? github.transparent
---@field on_highlights? fun(colors: github.colors, color: github.color): github.groups
---@field on_colors? fun(colors: github.colors, color: github.color): github.colors
---@field styles? github.styles
---@field error_lens? github.error_lens

local config = {
  on_highlights = nil,
  on_colors = nil,
  styles = {
    types = {},
    functions = {},
    parameters = {},
    comments = {},
    strings = {},
    keywords = {},
    variables = {},
    statements = {},
    constants = {},
  },
  transparent = {
    enabled = false,
    pmenu = true,
    normal = true,
    normalfloat = true,
    neotree = true,
    whichkey = true,
    telescope = true,
    lazy = true,
    mason = true,
  },
  error_lens = {
    text = false,
    symbol = false,
  },
}

return config
