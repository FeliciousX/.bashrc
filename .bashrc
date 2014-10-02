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

# User specified functions

# Setting proxy for swinwifi
function setproxy() {
    # Setting proxies for most applications
    export {http,https}_proxy='58.26.207.170:8000'
    export {HTTP,HTTPS}_PROXY='58.26.207.170:8000'
    export no_proxy='localhost,127.0.0.0/8'
    export NO_PROXY='localhost,127.0.0.0/8'

    # Setting proxies for github
    rm ~/.gitconfig
    cp ~/Public/gitconfig/.gitconfigswin ~/.gitconfig

    # Setting proxies for Java
    export _JAVA_OPTIONS='-Dhttp.proxyHost=wwwproxy.swinburne.edu.my -Dhttp.proxyPort=8000 -Dhttps.proxyHost=wwwproxy.swinburne.edu.my -Dhttps.proxyPort=8000'

    # Setting proxies for GTK3 Programs
    gsettings set org.gnome.system.proxy mode 'manual'
    gsettings set org.gnome.system.proxy.http host 'wwwproxy.swinburne.edu.my'
    gsettings set org.gnome.system.proxy.http port 8000

    echo "Proxy set!"
}

# Remove proxies
function unsetproxy() {
    unset {http,https}_proxy
    unset {HTTP,HTTPS}_PROXY
    unset no_proxy
    unset NO_PROXY
    unset _JAVA_OPTIONS

    # Unsetting proxies for github
    rm ~/.gitconfig
    cp ~/Public/gitconfig/.gitconfig ~/.gitconfig

    gsettings set org.gnome.system.proxy mode 'none'
    echo "Proxy cleared"
}


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
	local BLACKBOLD="\[\033[1;30m\]"
	local RED="\[\033[0;31m\]"
	local REDBOLD="\[\033[1;31m\]"
	local GREEN="\[\033[0;32m\]"
	local GREENBOLD="\[\033[1;32m\]"
	local YELLOW="\[\033[0;33m\]"
	local YELLOWBOLD="\[\033[1;33m\]"
	local BLUE="\[\033[0;34m\]"
	local BLUEBOLD="\[\033[1;34m\]"
	local PURPLE="\[\033[0;35m\]"
	local PURPLEBOLD="\[\033[1;35m\]"
	local CYAN="\[\033[0;36m\]"
	local CYANBOLD="\[\033[1;36m\]"
	local WHITE="\[\033[0;37m\]"
	local WHITEBOLD="\[\033[1;37m\]"
	export PS1="\n$GREENBOLD\u@\h\[\033[00m\]:$BLUEBOLD\w $GREENBOLD \\$ $WHITEBOLD "
}
prompt

