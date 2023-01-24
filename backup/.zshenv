
######################################
# Other
######################################

# Performance analisis
# Exec zprof on shell
# zmodload zsh/zprof

######################################
# General environment variables
######################################
export DEMETER="$HOME/Demeter"
export XDG_DATA_HOME=".config"
export EDITOR='hx'
export MANPATH="/usr/local/man:$MANPATH"
# Disable some less nonsense
export LESSHISTFILE=-
# Move .zcomdump files to cache folder
export ZSH_COMPDUMP="$HOME/.cache/zsh/.zcomdump-$(zsh --version)"
# Disable magic functions
#https://github.com/ohmyzsh/ohmyzsh/issues/5569
DISABLE_MAGIC_FUNCTIONS=true
# Disable compinit to improve performance
skip_global_compinit=1

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
