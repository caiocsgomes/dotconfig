return {
	"L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		-- load snippets from path/of/your/nvim/config/my-cool-snippets
		require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
    require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
