# =====================================================================
# 
# Aliases
#
# =====================================================================

alias cl='clear'
alias l='ls -la'
alias q='exit'
function open() {
    xdg-open "$*" &
}

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

# Start IRC on pi
function irc() {
    if [[ -z $(ifconfig | grep tun0) ]]; then
        echo "OpenVPN not connected. Trying to connect...";
        CONN=$(nmcli connection | grep vpn | cut -d " " -f1)
        if [[ -z $CONN ]]; then
            echo "No VPN connection available. Connect manually.";
            return;
        fi
        nmcli connection up $CONN
        ssh weechat@pi.weechat
        nmcli connection down $CONN
    else
        echo "OpenVPN connected. Connecting to SSH.";
        ssh weechat@pi.weechat
    fi
}
