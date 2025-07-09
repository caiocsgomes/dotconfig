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
alias startday="sh ~/.config/scripts/startday.sh"
alias notes="cd ~/.config/notes/ && nn"
alias cli="wtt cli && cd ~/code"
alias downloads="cd ~/Downloads"
alias cd="z"
alias gp="git push"
alias gs="git status"
alias gpl="git pull"

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
alias fd='cd $(fd --type directory | fzf)' ## jump into folder
alias fn='nvim $(fzf --preview "cat {}")' ## neovim into file
alias ff='cd "$(dirname "$(fzf)")"'
