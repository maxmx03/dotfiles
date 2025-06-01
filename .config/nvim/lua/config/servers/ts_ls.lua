local function pwd()
  local dir, err, err_name = vim.uv.cwd()
  if err ~= nil or dir == nil or string.len(dir) == 0 then
    if err_name then
      return ''
    end
    return ''
  end
  return dir
end

return {
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
  },
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        -- location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
        location = string.format('%s/node_modules/@vue/typescript-plugin', pwd()),
        languages = { 'javascript', 'typescript', 'vue' },
      },
    },
    preferences = {
      includeInlayParameterNameHints = 'none',
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = false,
      includeInlayVariableTypeHints = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
      importModuleSpecifierPreference = 'non-relative',
      organizeImportsIgnoreCase = 'auto',
      organizeImportsCollation = 'ordinal',
      organizeImportsCollationLocale = 'en',
      organizeImportsNumericCollation = false,
      organizeImportsAccentCollation = true,
      organizeImportsCaseFirst = false,
      quotePreference = 'auto',
    },
  },
}
