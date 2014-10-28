# User specified aliases
# piping fortune into cowsay
fortune | cowsay | lolcat

# Default editor
export EDITOR=vim

# ls now has colours
alias ls='ls --color=auto'

# installing packages
alias apt-get='sudo apt-get'
alias pacman='sudo -E pacman'
alias yaourt='sudo -E yaourt'

# extracting tar.gz files
alias targz='tar zxf'
#extracting .tar files
alias tartar='tar xvf'

# controlling backlight brightness
alias light='xbacklight -inc'
alias dark='xbacklight -dec'

alias letdarknessfall='xbacklight -dec 100'
alias lettherebelight='xbacklight -inc 100'

# controlling sound mute and unmute
alias shutup='amixer set Master mute'
alias youcanspeaknow='amixer set Master unmute'

# controlling bumblebee
alias bankai='sudo tee /proc/acpi/bbswitch <<<ON'
alias shikai='sudo tee /proc/acpi/bbswitch <<<OFF'

# shortcuts for git
alias gst='git status'
alias gch='git checkout'
alias gcl='git clone'

# User specified functions

# Setting proxy for swinwifi
function setproxy() {
if [[ -f ~/.bash/setproxy ]]; then
    . ~/.bash/setproxy
fi
}

# Remove proxies
function unsetproxy() {
if [[ -f unsetproxy ]]; then
    . ~/.bash/unsetproxy
fi
}

# if terminal supports 256-color, use it!
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

# auto colour terminal
#PS1='[\u@\h \W]\$ ' # Default

#Prompt and prompt colors
# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# 0 - Normal
# 1 - Bold
function prompt {
local BLACK="\[\033[0;30m\]"
local RED="\[\033[0;31m\]"
local GREEN="\[\033[0;32m\]"
local YELLOW="\[\033[0;33m\]"
local BLUE="\[\033[0;34m\]"
local PURPLE="\[\033[0;35m\]"
local CYAN="\[\033[0;36m\]"
local WHITE="\[\033[0;37m\]"
export PS1="\n$GREEN\u@\h\[\033[00m\]:$BLUE\w $GREEN\\$ $WHITE"
}
prompt
