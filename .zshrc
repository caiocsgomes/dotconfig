# zshel
# ZSH_THEME=robbyrussel
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(terraform kubectl helm git zsh-autosuggestions zsh-syntax-highlighting)
eval "$(zoxide init zsh)"
source $ZSH/oh-my-zsh.sh
## Aliases
alias homelab="cd ~/personal/homelab"
alias cdpersonal="cd ~/personal"
alias cdcode="cd ~/code"
alias cdconfig="cd ~/.config"
alias n="nvim"
alias nn='wtt $(basename "$PWD") && nvim .'
alias config="cd ~/.config/ && nvim"
alias notes="cd ~/.config/notes/ && nn"
alias cli="wtt cli && cd ~/code"
alias downloads="cd ~/Downloads"
alias cd="z"
alias c="clear"
alias gpp="git push"
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gp="git pull"
git_main() {
  local main_branch=""
  # Check if 'main' branch exists
  if git show-ref --verify --quiet refs/heads/main || git show-ref --verify --quiet refs/remotes/origin/main; then
    main_branch="main"
  # Check if 'master' branch exists
  elif git show-ref --verify --quiet refs/heads/master || git show-ref --verify --quiet refs/remotes/origin/master; then
    main_branch="master"
  else
    echo "Neither 'main' nor 'master' branch found."
    return 1
  fi
  echo "Checking out $main_branch branch..."
  git checkout "$main_branch"
}
alias gm="git_main"

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


## iterm2
export TERM=xterm-256color

## Starship
# export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

export PATH=$HOME/.local/bin:$PATH

# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
