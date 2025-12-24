-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
keymap.set("i", "jk", "<ESC>", { desc = "ESC to enter normal mode" })

vim.keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "add comma to end of line" })
vim.keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "add semicolon to end of line" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "ESC to enter normal mode" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

function _G.smart_end_of_line()
  -- Check if we're in insert mode
  if vim.fn.mode() == "i" then
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]

    -- Check if we're already at the end of the line
    if col >= #line then
      -- We're at the end of line, check for unclosed pairs
      local unclosed = {}
      local brackets = { -- Renamed from 'pairs' to 'brackets'
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ['"'] = '"',
        ["'"] = "'",
        ["`"] = "`",
      }

      -- Track if we're inside a string
      local in_single_quote = false
      local in_double_quote = false
      local escaped = false

      -- Simple stack-based parser to find unclosed pairs
      for i = 1, #line do
        local char = line:sub(i, i)

        -- Handle escape character
        if char == "\\" then
          escaped = not escaped
        else
          if char == '"' and not escaped and not in_single_quote then
            in_double_quote = not in_double_quote
            if in_double_quote then
              table.insert(unclosed, '"')
            else
              -- Remove the matching quote
              for j = #unclosed, 1, -1 do
                if unclosed[j] == '"' then
                  table.remove(unclosed, j)
                  break
                end
              end
            end
          elseif char == "'" and not escaped and not in_double_quote then
            in_single_quote = not in_single_quote
            if in_single_quote then
              table.insert(unclosed, "'")
            else
              -- Remove the matching quote
              for j = #unclosed, 1, -1 do
                if unclosed[j] == "'" then
                  table.remove(unclosed, j)
                  break
                end
              end
            end
          elseif not in_single_quote and not in_double_quote then
            -- Only process brackets when not inside a string
            if brackets[char] then
              table.insert(unclosed, char)
            elseif vim.tbl_contains(vim.tbl_values(brackets), char) then
              -- Find the matching opening character
              for open, close in pairs(brackets) do -- Using the built-in pairs() function
                if close == char then
                  -- Look for the matching opening character
                  for j = #unclosed, 1, -1 do
                    if unclosed[j] == open then
                      table.remove(unclosed, j)
                      break
                    end
                  end
                  break
                end
              end
            end
          end

          escaped = false
        end
      end

      -- Close any unclosed pairs in reverse order
      local closing = ""
      for i = #unclosed, 1, -1 do
        closing = closing .. brackets[unclosed[i]] -- Using brackets instead of pairs
      end

      if closing ~= "" then
        return closing
      else
        return ""
      end
    else
      -- Not at end of line, move to end of line
      return "<Esc>A"
    end
  else
    -- Not in insert mode
    return ""
  end
end

vim.keymap.set("i", "<C-e>", function()
  return vim.api.nvim_replace_termcodes(_G.smart_end_of_line(), true, true, true)
end, { expr = true })
vim.keymap.set("n", "<leader>e", function()
  local MiniFiles = require("mini.files")
  local _ = MiniFiles.close() or MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  vim.defer_fn(function()
    MiniFiles.reveal_cwd()
  end, 30)
end, { desc = "Open MiniFiles" })

-- Yank current buffer filepath to clipboard
vim.keymap.set("n", "<leader>yP", function()
  local filepath = vim.fn.expand("%:p")
  vim.fn.setreg("+", filepath)
  vim.notify("Copied filepath: " .. filepath)
end, { desc = "Yank full filepath to clipboard" })

-- Yank filepath relative to working directory
vim.keymap.set("n", "<leader>yp", function()
  local relpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
  vim.fn.setreg("+", relpath)
  vim.notify("Copied path relative to CWD: " .. relpath)
end, { desc = "Yank filepath relative to current working directory" })

-- vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
