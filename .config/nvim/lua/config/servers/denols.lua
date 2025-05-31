local nvim_lsp = require 'lspconfig'

return {
  root_dir = nvim_lsp.util.root_pattern('deno.json', 'deno.jsonc'),
  settings = {
    editor = {
      inlayHints = {
        enabled = true,
      },
    },
    deno = {
      enablePaths = {
        './',
      },
      enable = true,
      lint = true,
      unstable = true,
      suggest = {
        imports = {
          hosts = {
            ['https://deno.land'] = true,
          },
        },
      },
    },
  },
}
