# User specified aliases
# piping fortune into cowsay
fortune | cowsay | lolcat

# Default editor
export EDITOR=vim

# installing packages
alias apt-get='sudo apt-get'
alias pacman='sudo -E pacman'
alias yaourt='sudo -E yaourt'

# extracting tar.gz files
alias targz='tar zxf'

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
function setproxy() {
    # Setting proxies for most applications
    export {http,https}_proxy='58.26.207.170:8000'
    export {HTTP,HTTPS}_PROXY='58.26.207.170:8000'
    export no_proxy='localhost,127.0.0.0/8'
    export NO_PROXY='localhost,127.0.0.0/8'

    # Setting proxies for github
    rm ~/.gitconfig
    cp ~/Public/.gitconfigswin ~/.gitconfig

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
    cp ~/Public/.gitconfigdefault ~/.gitconfig

    gsettings set org.gnome.system.proxy mode 'none'
    echo "Proxy cleared"
}
