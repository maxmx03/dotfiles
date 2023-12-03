return {
  'David-Kunz/gen.nvim',
  opts = {
    model = 'mistral',      -- The default model to use.
    display_mode = 'float', -- The display mode. Can be "float" or "split".
    show_prompt = false,    -- Shows the Prompt submitted to Ollama.
    show_model = true,      -- Displays which model you are using at the beginning of your chat session.
    no_auto_close = false,  -- Never closes the window automatically.
    init = function(options)
      pcall(io.popen, 'ollama serve > /dev/null 2>&1 &')
    end,
    command = 'curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body',
    debug = false, -- Prints errors and the command which is run.
  },
  config = function()
    require('gen').prompts['Enhance_ReactTDD_Code'] = {
      prompt =
      'Enhance the following code (React Testing Library), only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```',
      replace = true,
      extract = '```$filetype\n(.-)```',
    }
  end,
}
