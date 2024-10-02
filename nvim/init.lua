require("core/options")
-- require("core/icons")
require("core/keymaps")
require("config/lazy")

vim.api.nvim_create_user_command('EchoCwd', function()
  print(vim.fn.getcwd())
end, {})
