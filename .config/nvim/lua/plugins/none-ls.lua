return {
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'
      local formatters = require 'formatters'
      local linters = require 'linters'

      local function map(builtins, sources, callback)
        if sources then
          for _, source in pairs(sources) do
            if type(source) == 'table' then
              callback(builtins[source.name].with(source.config or {}))
            else
              callback(builtins[source])
            end
          end
        end
      end

      local function sources(opts)
        local s = {}

        map(null_ls.builtins.formatting, opts.formattings, function(source)
          table.insert(s, source)
        end)

        map(null_ls.builtins.diagnostics, opts.diagnostics, function(source)
          table.insert(s, source)
        end)

        return s
      end

      null_ls.setup {
        debug = false,
        sources = sources {
          formattings = formatters,
          diagnostics = linters,
        },
      }
    end,
  },
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'nvimtools/none-ls.nvim',
    },
  },
}
