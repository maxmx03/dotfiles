return {
  settings = {
    Lua = {
      hint = {
        enable = true,
      },
      runtime = {
        version = 'Lua5.4',
      },
      workspace = {
        checkThirdParty = true,
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library',
          '${3rd}/busted/library',
        },
      },
    },
  },
}
