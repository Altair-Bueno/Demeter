################################################################################
# Other
################################################################################
# Performance analisis
# Exec zprof on shell
# zmodload zsh/zprof

################################################################################
# General environment variables
################################################################################
export DEMETER="$HOME/Demeter"
export XDG_DATA_HOME=".config"
export EDITOR='hx'
export MANPATH="/usr/local/man:$MANPATH"
export LESSHISTFILE=-
# Move .zcomdump files to cache folder
export ZSH_COMPDUMP="$HOME/.cache/zsh/.zcomdump-$ZSH_VERSION"
# Bat theme
export BAT_THEME='base16'
export BAT_STYLE='plain,rule,header-filename,header-filesize'
export _ZO_ECHO=1
# Disable magic functions
#https://github.com/ohmyzsh/ohmyzsh/issues/5569
DISABLE_MAGIC_FUNCTIONS=true
# Disable compinit to improve performance
skip_global_compinit=1
# Disable do you wish to see all x posibilities
# https://github.com/marlonrichert/zsh-autocomplete/issues/388
# zstyle ':completion:*' list-prompt   ''
# zstyle ':completion:*' select-prompt ''
zstyle ':completion:*:*:man:*:*' menu select=long search
# zsh autocomplete https://github.com/marlonrichert/zsh-autocomplete/blob/main/.zshrc
# zstyle ':autocomplete:*' insert-unambiguous yes # autocomplete just the common part
zstyle ':autocomplete:*' fzf-completion yes     # use fzf autocomplete
# From https://www.reddit.com/r/zsh/comments/wxlmjo/configure_up_arrow_to_get_last_command_from_this/
setopt NO_SHARE_HISTORY

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
path+="$HOME/.cargo/bin"
fpath+=($HOME/.rustup/toolchains/*/share/zsh/site-functions)

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
