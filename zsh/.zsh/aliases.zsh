# =====================================================================
# 
# Aliases
#
# =====================================================================

# Common
alias cl='clear'
alias l='ls -la'
alias q='exit'
function open() {
    xdg-open "$*" &
}

# Programs
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Git
alias ga='git add -A'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'

# What is my ip
alias whatsmyip='curl https://ipinfo.io/ip'

# Tmux
alias tmux='TERM=screen-256color tmux'

# Send to my webserver for static files
function webshare() {
    cp $1 ~/Nextcloud/webshare/
    echo https://ws.stmpj.xyz/$1
}
