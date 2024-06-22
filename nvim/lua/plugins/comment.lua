-- import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
  print("Module Comment had an error loading")
  return
end

-- enable comment
comment.setup()
