return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { { "filename", path = 1, file_status = true } },
    },
  },
}
