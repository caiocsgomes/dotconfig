# zshel
# ZSH_THEME=robbyrussel
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
# Trimmed plugins for faster startup (removed git-commit, git-extras)
# Trimmed for faster startup (these registered ~851 completion defs): docker terraform kubectl helm
plugins=(git zsh-autosuggestions zsh-syntax-highlighting gh)

# Let OMZ run a single compinit; skip its slow compaudit security check.
# OMZ already caches the completion dump daily.
export ZSH_DISABLE_COMPFIX=true
skip_global_compinit=1

source $ZSH/oh-my-zsh.sh
## Aliases
alias homelab="cd ~/personal/homelab"
alias cdpersonal="cd ~/personal"
alias cdcode="cd ~/code"
alias cdconfig="cd ~/.config"
alias n="nvim"
# alias nn='wtt $(basename "$PWD") && nvim .'
alias config="cd ~/.config/ && nvim"
alias notes="cd ~/.config/notes/ && nn"
# alias cli="wtt cli && cd ~/code"
alias dwl="cd ~/Downloads"
alias cd="z"
alias c="clear"
alias k="kubectl"

## eza (ls replacement)
alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first --git"
alias la="eza -la --icons --group-directories-first --git"
alias lt="eza --tree --level=2 --icons"

## Credentials
source ~/.config/.credentials.sh

## Go
export GOPATH=$HOME/go
export GOROOT=/opt/homebrew/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

## Wezterm
wtt() {wezterm cli set-tab-title "$1"}

## Variables
export LG_CONFIG_FILE=~/.config/nvim/lua/config/lazygit/config.yaml

## fzf aliases
fzfcd() {
  local file
  file=$(find . -type f 2>/dev/null | fzf)
  if [ -n "$file" ]; then
    cd "$(dirname "$file")"
  fi
}
alias fzfvim='nvim $(fzf --preview "cat {}")' ## neovim into file
alias fzfcat='fzf --preview "cat {}"'
fzfpath() { ## realpath of selected file, copied to clipboard
  local file
  file=$(fzf --preview "cat {}")
  if [ -n "$file" ]; then
    realpath "$file" | tee /dev/tty | pbcopy
  fi
}
fzfgrep() {
  INITIAL_QUERY=""
  RG_PREFIX="rg --line-number --no-heading --color=always --smart-case "
  FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'" \
  fzf --ansi \
      --disabled --query "$INITIAL_QUERY" \
      --bind "change:reload:$RG_PREFIX {q} || true" \
      --delimiter : \
      --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
}

# tmux
alias ta="tmux attach"

## Environment Variables
export XDG_CONFIG_HOME="$HOME/.config"
export MULLVAD_ID="7964237069900309"

## iterm2
export TERM=xterm-256color

## Starship
# export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"
export PATH=$HOME/.local/bin:$PATH

## Github cli
export EDITOR=nvim
alias gplist="gh pr list | fzf --preview 'gh pr view {1}' --preview-window=up:70% | awk '{print \$1}' | xargs gh pr view --web"
alias gpview="gh pr view --web"
alias gpcreate="gh pr create"

## lazygit
export lg="lazygit"
