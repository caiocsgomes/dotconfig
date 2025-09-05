return {
  "ibhagwan/fzf-lua",
  opts = {
    files = {
      cmd = "fd --type f --hidden --exclude .git",
    },
    grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git/*'",
    },
    live_grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git/*'",
    },
  },
}
