return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      -- ["<C-l>"] = { "accept_and_enter", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500, -- Show docs after 500ms instead of immediately
      },
    },
  },
}
