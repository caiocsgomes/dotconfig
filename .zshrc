# zshel
# ZSH_THEME=robbyrussel
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(docker terraform kubectl helm git zsh-autosuggestions zsh-syntax-highlighting gh git-commit git-extras)
eval "$(zoxide init zsh)"
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
export gpl="gh pr list | fzf --preview 'gh pr view {1}' --preview-window=up:70% | awk '{print $1}' | xargs gh pr view --web"
export gpv="gh pr view --web"
export gpc="gh pr create"
