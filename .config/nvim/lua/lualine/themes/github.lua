local colors = {
  blue   = '#61afef',
  green  = '#98c379',
  purple = '#d2a8ff',
  cyan   = '#a5d6ff',
  red1   = '#e06c75',
  red2   = '#be5046',
  yellow = '#e5c07b',
  fg     = '#f0f6fc',
  bg     = '#282c34',
  gray1  = '#51545a',
  gray2  = '#3e4148',
  gray3  = '#282c34',
}

return {
  normal = {
    a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.gray3 },
    c = { fg = colors.fg, bg = colors.gray2 },
  },
  command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
  insert = { a = { fg = colors.bg, bg = colors.blue, gui = 'bold' } },
  visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
  terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' } },
  replace = { a = { fg = colors.bg, bg = colors.red1, gui = 'bold' } },
  inactive = {
    a = { fg = colors.gray1, bg = colors.bg, gui = 'bold' },
    b = { fg = colors.gray1, bg = colors.bg },
    c = { fg = colors.gray1, bg = colors.gray2 },
  },
}
