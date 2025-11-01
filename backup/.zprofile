################################################################################
# Environment variables
################################################################################
export DEMETER="$HOME/Demeter"
export XDG_DATA_HOME="$HOME/.config"
export EDITOR='hx'
export MANPATH="/usr/local/man:$MANPATH"
export LESSHISTFILE=-
export BAT_THEME='base16'
export BAT_STYLE='plain'
export _ZO_ECHO=1
export SCCACHE_CACHE_SIZE='5G'
export NODE_REPL_HISTORY=""
export PNPM_HOME="$HOME/.config/pnpm"
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1
export HOMEBREW_BUNDLE_FILE_GLOBAL="$XDG_DATA_HOME/Brewfile-$(uname)"
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX"
export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"

################################################################################
# SDKs
################################################################################
# Altra corporación (Airzone)
# source "$HOME/Developer/scripts/env.sh"

path=(
    # Altra corporación (Airzone)
    "$HOME/Developer/scripts/scripts"
    # Demeter scripts
    "$DEMETER/scripts"
    # Rust cargo
    "$HOME/.cargo/bin"
    # Pnpm
    "$PNPM_HOME"
    # Local binaries
    "$HOME/.local/bin"
    # Homebrew
    '/opt/homebrew/bin'
    '/opt/homebrew/opt/make/libexec/gnubin'
    # System paths
    "${path[@]}"
)

fpath=(
    "$HOMEBREW_PREFIX/share/zsh/site-functions"
    "$HOME/.rustup/toolchains/"*/share/zsh/site-functions
    "${fpath[@]}"
)

path=(${(u)path})
fpath=(${(u)fpath})
