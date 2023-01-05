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

# fnm (nvm)
eval "$(fnm env --use-on-cd)"

# Basictex
path+='/Library/TeX/texbin'

######################################
# Aliases
######################################
alias nvm='fnm'
alias iterm='open -a "iterm"'
alias python='python3.11'
alias pip='python -m pip'
alias ascii='asciinema'
alias neofetch='macchina'
alias exa='exa --icons --sort=type'
alias httpserv='npx http-server'
alias vim='hx'
alias http='xh'
alias https='xhs'
alias cat='bat'
alias tree='exa --tree'

######################################
# Custom env variables
######################################
export DEMETER="$HOME/Demeter"
export XDG_DATA_HOME=".config"

######################################
# OS dependent config
######################################
if [[ $(uname) == 'Darwin' ]]
then
    # macOS specific config

    # WTF Microsoft. Starting a whole Python interpreter for opening vscode????
    # https://github.com/microsoft/vscode/issues/60579
    # Note: Apparently they switch to bash!!
    # alias code="open -b com.microsoft.VSCode"
    
    # From https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos
    function quick-look {
        (( $# > 0 )) && qlmanage -p $* &> /dev/null &
    }
    # `map` for the macOS keyboard
    function pbmap {
        pbpaste | $* | pbcopy
    }
elif [[ $(uname) == 'Linux' ]]
then
    # Linux specific config
    alias open='xdg-open'
fi

