return {
	{
    -- Plugin to bridge between external LSP and neovim
		"williamboman/mason.nvim",
	},
  {
    -- Plugin to manage the LSP through mason
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local ensure_installed = {
        "bashls",
        "cssls",
        "dockerls",
        "gopls",
        "html",
        "jsonls",
        "pyright",
        "tsserver",
        "vimls",
        "yamlls",
      },
    end,
  },
}
