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
export NODE_REPL_HISTORY=""
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

path=(
    # Commandline utils made with zsh
    "$DEMETER/scripts"
    # Rust cargo
    "$HOME/.cargo/bin"
    # Homebrew
    '/usr/local/bin' 
    '/usr/local/sbin'
    $path 
)

fpath+=(
    "$HOME/.rustup/toolchains/*/share/zsh/site-functions"
    $fpath
)
