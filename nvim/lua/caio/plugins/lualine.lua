-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end
local status 
local custom_gruvbox = require'lualine.themes.gruvbox'

lualine.setup {
  options = { theme  = custom_gruvbox },
}
