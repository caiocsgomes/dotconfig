# zshel
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
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

## Kubernetes
alias k="kubectl"
kn() { kubectl config set-context --current --namespace="$1" }
kv() { kubectl get pod "$1" -o yaml | nvim }
alias kc="k config current-context"

## Terraform
alias tf="terraform"

## Credentials
source ~/.config/.credentials.sh

## Go
export GOPATH=$HOME/go 
export GOROOT=/usr/local/go 
export GOBIN=$GOPATH/bin 
export PATH=$PATH:$GOPATH 
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

## Wezterm
wtt() {wezterm cli set-tab-title "$1"}

## Variables
export LG_CONFIG_FILE=~/.config/nvim/lua/config/lazygit/config.yaml

## fzf aliases
fcd() {
  local file
  file=$(find . -type f 2>/dev/null | fzf)
  if [ -n "$file" ]; then
    cd "$(dirname "$file")"
  fi
}
alias fnvim='nvim $(fzf --preview "cat {}")' ## neovim into file
alias fcat='fzf --preview "cat {}"'

# tmux
alias ta="tmux attach"

## Environment Variables
export XDG_CONFIG_HOME="$HOME/.config"
