local Runner = require 'lib.runner'

return {
  c = function(dir)
    ---@type Runner
    local c = Runner:new {
      root_files = {
        'makefile',
        'Makefile',
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac',
        'main.c',
      },
      cmd = 'gcc %s -o ./bin/program && ./bin/program',
      dir = dir,
    }
    return c:create()
  end,
  cpp = function(dir)
    ---@type Runner
    local cpp = Runner:new {
      root_files = {
        'makefile',
        'Makefile',
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac',
        'main.cpp',
      },
      cmd = 'g++ %s -o ./bin/program && ./bin/program',
      dir = dir,
    }
    return cpp:create()
  end,
  lua = function(dir)
    ---@type Runner
    local lua = Runner:new {
      root_files = { 'init.lua', 'stylua.toml', '.stylua.toml' },
      cmd = 'luac -o ./bin/program.lc %s && lua ./bin/program.lc',
      -- cmd = 'luajit -b %s -X ./bin/program && luajit ./bin/program',
      dir = dir,
    }
    return lua:create()
  end,
  python = function(dir)
    ---@type Runner
    local python = Runner:new {
      root_files = { 'main.py' },
      cmd = 'python %s',
      dir = dir,
      makeBin = false,
    }
    return python:create()
  end,
  go = function(dir)
    ---@type Runner
    local go = Runner:new {
      root_files = { 'main.go', 'go.mod' },
      cmd = 'go build -o ./bin/program && ./bin/program',
      dir = dir,
    }
    return go:create()
  end,
}
