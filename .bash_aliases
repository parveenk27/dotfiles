## Aliases
## =======

## NOTE
# If the last character of the alias value is a blank,
# then the next command word following the alias is
# also checked for alias expansion.
# So this is just a nice way of making sure your commands
# are evaluated for aliases before being passed over to sudo,
# which ends up being pretty useful.
alias sudo='sudo '

# Git
alias ga='git add'
alias gc='git commit -v'
alias gd='git diff'
alias gds='gd --staged'
alias gs='git status'
alias gl='git log --graph --decorate -20'
alias glo='git log --graph --decorate --oneline -20'
alias gp='git pull'
alias gf='git fetch'
alias gco='git checkout'
alias gcm='gco master'

# ls
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'
alias lss='ls -1'
alias lsa='lss -A'

# Vim
alias vimdiff='vim -d' # Start in diff-mode

# Easy navigation
alias desktop="cd ~/Desktop"
alias documents="cd ~/Documents"
alias downloads="cd ~/Downloads"
alias dl="cd ~/Downloads"
alias tmp="cd /tmp"
[[ -d ~/Documents/repos ]] && alias repos="cd ~/Documents/repos"
[[ -d ~/Documents/vms ]] && alias vms="cd ~/Documents/vms"

# Others
[[ -z "$(type -P pbcopy)" ]] && alias pbcopy="xclip -selection clipboard"

# Overrides
[[ -n "$(type -P bat)" ]] && alias cat='bat -pp --theme="Monokai Extended Bright"'
[[ -n "$(type -P bat)" ]] && alias less='bat -pp --paging=always'
[[ -n "$(type -P delta)" ]] && alias diff='delta'

# Parenting perms on /
if [[ "$(uname -s)" == "Linux" ]]; then
  alias chown='chown --preserve-root'
  alias chmod='chmod --preserve-root'
  alias chgrp='chgrp --preserve-root'
fi

#JSON parser and pretty-printing tool for the command line
#Usage (Output formatted JSON to command line):  jsp [unformatted.json]
#Usage (Output formatted JSON to a file): jsp [unformatted.json] > output.json
#IMPORTANT: You must have Python 3 and json.tool installed BEFORE this alias will work
alias jsp='python3 -m json.tool < '

# Stop after sending count ECHO_REQUEST packets
alias ping='ping -c 5'

# Ask for confirmation and be verbose
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -iv'
alias mkdir='mkdir -v'

# Docker, Kubernetes, Helm
alias d-bash="docker run -it --rm --log-driver none --entrypoint=/bin/bash"
alias d-sh="docker run -it --rm --log-driver none --entrypoint=/bin/sh"
alias d="docker"
alias h="helm"
alias k="kubectl"
alias kd="kubectl describe"
alias ke="kubectl exec -it"
alias kg="kubectl get"
alias kl="kubectl logs"
alias kgw='kubectl get --watch --output-watch-events'
alias krun='kubectl run --rm --restart=Never --image-pull-policy=IfNotPresent -i -t'

## Bash completion
## ===============

#shellcheck disable=SC1090
[[ -n "$(type -P kubectl)" ]] && source <(kubectl completion bash)

#shellcheck disable=SC1090
[[ -n "$(type -P helm)" ]] && source <(helm completion bash)

#shellcheck disable=SC1090
if [[ -f ~/.bash_completion.d/complete_alias ]]; then
  source ~/.bash_completion.d/complete_alias
  complete -F _complete_alias d d-bash d-sh d-run
  complete -F __start_kubectl k
  complete -F __start_helm h
fi

## FZF settings
## ============
# Use , as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER=','

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
