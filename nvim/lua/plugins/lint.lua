-- ~/.config/nvim/lua/plugins/lint.lua
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- Remove markdownlint from markdown files completely
        markdown = {},
      },
      -- Keep this config in case markdownlint is called in another way
      linters = {
        markdownlint = {
          args = { "--disable", "MD001,MD002,MD003,MD004,MD005,MD006,MD007,MD008,MD009,MD010,MD011,MD012,MD013,MD014,MD018,MD019,MD020,MD021,MD022,MD023,MD024,MD025,MD026,MD027,MD028,MD029,MD030,MD031,MD032,MD033,MD034,MD035,MD036,MD037,MD038,MD039,MD040,MD041,MD042,MD043,MD044,MD045,MD046,MD047,MD048,MD049,MD050,MD051,MD052,MD053" },
        },
      },
    },
  },
}
