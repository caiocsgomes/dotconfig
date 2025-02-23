return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-nvim-lua",
    -- "hrsh7th/cmp-buffer",
    -- "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- "saadparwaiz1/cmp_luasnip",
    -- "L3MON4D3/LuaSnip",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline({
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      }),
      sources = cmp.config.sources({
        { name = "cmdline" },
      }),
    })
  end,
}
