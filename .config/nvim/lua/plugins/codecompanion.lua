return {
  'olimorris/codecompanion.nvim',
  config = function()
    local function getenv(v)
      return vim.fn.getenv(v) or vim.fn.environ()[v]
    end
    local GEMINI_API = getenv 'GEMINI_API'
    require('codecompanion').setup {
      prompt_library = {
        ['explain'] = {
          strategy = 'chat',
          description = 'Get some special advice from an LLM',
          opts = {
            short_name = 'expert',
            auto_submit = true,
            stop_context_insertion = true,
            user_prompt = true,
          },
          prompts = {
            {
              role = 'system',
              content = function(context)
                return 'I want you to act as a senior '
                  .. context.filetype
                  .. ' developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples.'
              end,
            },
            {
              role = 'user',
              content = function(context)
                local text = require('codecompanion.helpers.actions').get_code(
                  context.start_line,
                  context.end_line
                )
                return 'I have the following code:\n\n```'
                  .. context.filetype
                  .. '\n'
                  .. text
                  .. '\n```\n\n'
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
      },
      strategies = {
        chat = {
          adapter = 'gemini',
        },
        inline = {
          adapter = 'gemini',
        },
        cmd = {
          adapter = 'gemini',
        },
        keymaps = {
          accept_change = {
            modes = { n = 'ga' },
            description = 'Accept the suggested change',
          },
          reject_change = {
            modes = { n = 'gr' },
            description = 'Reject the suggested change',
          },
        },
      },
      adapters = {
        gemini = function()
          return require('codecompanion.adapters').extend('gemini', {
            name = 'gemini',
            env = {
              api_key = GEMINI_API,
            },
            schema = {
              model = {
                default = 'gemini-2.0-flash',
              },
            },
          })
        end,
      },
    }
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
