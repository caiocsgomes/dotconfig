-- Smart end-of-line function that automatically closes unclosed brackets, quotes, etc.
-- This is useful for quickly jumping to the end of a line and closing any open pairs

local M = {}

function M.smart_end_of_line()
  -- Only works in insert mode
  if vim.fn.mode() ~= "i" then
    return ""
  end

  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]

  -- If not at end of line, move to end
  if col < #line then
    return "<Esc>A"
  end

  -- At end of line - check for unclosed pairs
  local unclosed = {}
  local brackets = {
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
          for open, close in pairs(brackets) do
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
    closing = closing .. brackets[unclosed[i]]
  end

  return closing ~= "" and closing or ""
end

return M
