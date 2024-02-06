vim9script

g:disable_bg = 1
g:lightline = { colorscheme: 'rosepine' }

colorscheme rosepine

hi EndOfBuffer guifg=#191724 guibg=NONE
hi TablineSel guifg=#191724 guibg=#ebbcba
hi CocErrorSign guifg=#eb6f92 guibg=NONE
hi CocWarningSign guifg=#f6c177 guibg=NONE
hi CocInfoSign guifg=#9ccfd8 guibg=NONE
hi CocHintSign guifg=#c4a7e7 guibg=NONE
hi CocErrorVirtualText guifg=#eb6f92 guibg=#763849
hi CocWarningVirtualText guifg=#f6c177  guibg=#7b613c
hi CocInfoVirtualText guifg=#9ccfd8  guibg=#4e686c
hi CocHintVirtualText guifg=#c4a7e7  guibg=#625474

def CreateBuffer()
  enew

  setlocal buftype=nofile
  setlocal noswapfile
  setlocal nobuflisted
  setlocal nowrap

  var colors = {
    _nc: "#16141f",
    base: "#191724",
    surface: "#1f1d2e",
    overlay: "#26233a",
    muted: "#6e6a86",
    subtle: "#908caa",
    text: "#e0def4",
    love: "#eb6f92",
    gold: "#f6c177",
    rose: "#ebbcba",
    pine: "#31748f",
    foam: "#9ccfd8",
    iris: "#c4a7e7",
    highlight_low: "#21202e",
    highlight_med: "#403d52",
    highlight_high: "#524f67",
    none: "NONE",
  }

  var max_length = len(colors)
  for color in keys(colors)
    append(0, color .. repeat('.', max_length - strchars(color)) .. $'= "{colors[color]}"')
  endfor

  setlocal nomodifiable

  file RosePine\ Colors
enddef

if !exists(":Rose")
  command Rose :call CreateBuffer()
endif
