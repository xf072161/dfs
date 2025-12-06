setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

bindkey -v
bindkey "^[[91;5u" vi-cmd-mode
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char

fpath=(~/.zsh/plugins/git-completion/zsh/ $fpath)
source ~/.zsh/plugins/git-completion/prompt.sh

source ~/.zsh/plugins/zsh-z/zsh-z.plugin.zsh
source <(fzf --zsh)

zstyle ':completion:*' menu select

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export BREWBIN="/opt/homebrew/bin"
export PATH=$BREWBIN:$GOBIN:$PATH

PROMPT="$ "

alias ~="cd ~"
alias ..="cd .."
alias c="clear"
alias f="pwd"
alias n="nvim"
alias l="ls -a -lh -F"
alias b="git rev-parse --abbrev-ref HEAD"
alias cu=cursor-agent
alias cfg="cd ~/.dfs && nvim"
alias curlt="curl -kv -w '\n* Response time: %{time_total}s\n'"

alias gs="git stash"
alias gl="git pull"
alias gf="git fetch -p"
alias ga="git add"
alias gd="git diff"
alias gc="git commit"
alias gb="git branch"
alias gbd="git branch -D"
alias gp="git push origin \$(git rev-parse --abbrev-ref HEAD)"
alias gca="git commit --amend"
alias gcl="git clone "
alias gaa="git add -A"
alias gst="git status"
alias gco="git checkout"
alias gcb="git checkout -b"
alias glg="git log"
alias gll="git log --oneline"
alias grs="git restore"
alias gbd="git branch -d"
alias grss="git restore --staged"
alias gcmsg="git commit -m"
alias gclog="git shortlog -s -n"

alias compose="docker compose"
alias dkp="docker network prune -f && docker container prune -f && docker image prune -a -f && docker volume prune -a -f"
alias dkx="docker network prune -f && docker container prune -f && docker volume prune -a -f"
alias dkl="docker ps"
alias dke="docker exec"
alias dks="docker stop"
alias dksa="docker stop \$(docker ps -q)"

alias gox="go mod tidy"
alias got="go test -race ./..."
alias gog="go generate ./..."
alias gol="golangci-lint run --max-same-issues=0 --max-issues-per-linter=0 --show-stats"

gor() {
  env_file=$1
  shift
  set -a
  source "$env_file"
  set +a
  go run -race "$@"
}

goc () {
	t=$(mktemp)
	go test $COVERFLAGS -race -coverprofile=$t $@ && go tool cover -func=$t && unlink $t
}

gocw() {
	t=$(mktemp)
	go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}
