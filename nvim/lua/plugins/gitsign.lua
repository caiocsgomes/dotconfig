-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
	print("Module gitsigns had an error loading")
	return
end

-- configure/enable gitsigns
gitsigns.setup()
