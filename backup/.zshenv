################################################################################
# SDKs
################################################################################

# Homebrew installed tools
path+='/usr/local/bin'
path+='/usr/local/sbin'

# Commandline utils made with zsh
path+="$HOME/Demeter/scripts"

# JetBrains toolbox shell script location
path+="$HOME/.jetbrains"

# Rust cargo
. "$HOME/.cargo/env"

# Scala Cousier
path+="$HOME/Library/Application Support/Coursier/bin"

# OpenJDK Home
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"

# Bison
path+='/usr/local/opt/bison/bin'

# Stack
path+='/usr/local/bin/stack'

# Stack binaries
path+="$HOME/.local/bin"

# Glassfish
export GLASSFISH_HOME=/usr/local/opt/glassfish/libexec

# Python 3.10
path+='/usr/local/opt/python@3.10/bin'

# Volta package manager
export VOLTA_HOME="$HOME/.volta"
path+="$VOLTA_HOME/bin"

######################################
# Aliases
######################################
alias nvm='volta'
alias iterm='open -a "iterm"'
alias python='python3.10'
alias pip='python -m pip'
alias ascii='asciinema'
alias neofetch='macchina'
alias exa='exa --icons --sort=type'
alias httpserv='npx http-server'
alias vim='nvim'

######################################
# Custom env variables
######################################
export DEMETER="$HOME/Demeter"

######################################
# OS dependent config
######################################
if [[ $(uname) == 'Darwin' ]]
then
    # macOS specific config

    # WTF Microsoft. Starting a whole Python interpreter for opening vscode????
    # https://github.com/microsoft/vscode/issues/60579
    function code {
        open -b com.microsoft.VSCode $*
    }

    # Upgrade all Homebrew packages, zsh plugins and omz
    function sysupgrade {
        brew update
        brew upgrade
        brew upgrade --cask
        brew autoremove
        brew cleanup
        omz update
        rustup update stable
        for plugin in $ZSH_CUSTOM/*/*
        do
            if [[ -d "$plugin" ]]
            then
                git -C "$plugin" pull
            fi
        done 
    }

    # From https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos
    function man-preview {
        man -w "$@" &> /dev/null && man -t "$@" | open -f -a Preview || man "$@"
    }
    function quick-look {
        (( $# > 0 )) && qlmanage -p $* &> /dev/null &
    }
elif [[ $(uname) == 'Linux' ]]
then
    # Linux specific config
    alias open='xdg-open'
fi

