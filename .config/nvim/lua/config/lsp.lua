local lspconfig = require('lspconfig')

lspconfig.pyright.setup{}

lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
})

local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
  },
})
