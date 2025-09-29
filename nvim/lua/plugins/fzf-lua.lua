return {
  "ibhagwan/fzf-lua",
  opts = {
    files = {
      cmd = "fd --type f --hidden --no-ignore --exclude .git",
    },
    grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --no-ignore --glob '!.git/*'",
    },
    live_grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --no-ignore --glob '!.git/*'",
    },
  },
}
