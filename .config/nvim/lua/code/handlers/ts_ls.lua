local function handler()
  local lsp_config = require 'lspconfig'
  lsp_config.ts_ls.setup {
    init_options = {
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
end

return handler
