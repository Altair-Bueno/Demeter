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
