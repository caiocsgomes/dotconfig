return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
              inlayHints = {
                variableTypes = false,
                functionReturnTypes = false,
              },
            },
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = false,
              compositeLiteralFields = false,
              compositeLiteralTypes = false,
              constantValues = false,
              functionTypeParameters = false,
              parameterNames = false,
              rangeVariableTypes = false,
            },
            usePlaceholders = false, -- Disable function argument placeholders
          },
        },
      },
      -- Disable marksman LSP for markdown files
      marksman = {
        filetypes = {}, -- Empty list means no filetypes will trigger this LSP
      },
    },
  },
}
