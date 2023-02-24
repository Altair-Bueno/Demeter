################################################################################
# Other
################################################################################
# Performance analisis
# Exec zprof on shell
# zmodload zsh/zprof

################################################################################
# Environment variables and shell configuration
################################################################################
export DEMETER="$HOME/Demeter"
export XDG_DATA_HOME="$HOME/.config"
export EDITOR='hx'
export MANPATH="/usr/local/man:$MANPATH"
export LESSHISTFILE=-
export BAT_THEME='base16'
export BAT_STYLE='plain,rule,header-filename,header-filesize'
export _ZO_ECHO=1
export SCCACHE_CACHE_SIZE='5G'
# Disable compinit to improve performance
skip_global_compinit=1
# Disable do you wish to see all x posibilities
# https://github.com/marlonrichert/zsh-autocomplete/issues/388
# zstyle ':completion:*' list-prompt   ''
# zstyle ':completion:*' select-prompt ''
# https://stackoverflow.com/a/69533208/19176002
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:man:*:*' menu select=long search
# zsh autocomplete https://github.com/marlonrichert/zsh-autocomplete/blob/main/.zshrc
zstyle ':autocomplete:*' insert-unambiguous yes # autocomplete just the common part
zstyle ':autocomplete:*' fzf-completion yes     # use fzf autocomplete
# From https://www.reddit.com/r/zsh/comments/wxlmjo/configure_up_arrow_to_get_last_command_from_this/
setopt NO_SHARE_HISTORY
setopt auto_cd

################################################################################
# SDKs
################################################################################

# GNU sed
path=( '/usr/local/opt/gnu-sed/libexec/gnubin' $path )

# Homebrew installed tools
path+='/usr/local/bin'
path+='/usr/local/sbin'

# Commandline utils made with zsh
path+="$HOME/Demeter/scripts"

# Rust cargo
path+="$HOME/.cargo/bin"
fpath+=($HOME/.rustup/toolchains/*/share/zsh/site-functions)

# OpenJDK Home
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"

# Bison
path+='/usr/local/opt/bison/bin'

# Stack
path+='/usr/local/bin/stack'

# macOS dev tools
path+='/Library/Developer/CommandLineTools/usr/bin/'

# fnm (nvm)
eval "$(fnm env --use-on-cd)"

