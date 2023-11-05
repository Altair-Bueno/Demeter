################################################################################
# P10k theme
################################################################################
ZSH_THEME="powerlevel10k/powerlevel10k"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Customize P10k
source "$DEMETER/backup/.config/zsh/.p10k.zsh"

################################################################################
# Shell settings
################################################################################
autoload -U compinit
compinit -u -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcomdump-$ZSH_VERSION"
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.history"
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
skip_global_compinit=1
# Disable do you wish to see all x posibilities https://github.com/marlonrichert/zsh-autocomplete/issues/388
# zstyle ':completion:*' list-prompt   ''
# zstyle ':completion:*' select-prompt ''
# Case insensitive completions https://stackoverflow.com/a/69533208/19176002
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:man:*:*' menu select=long search
# zsh autocomplete https://github.com/marlonrichert/zsh-autocomplete/blob/main/.zshrc
zstyle ':autocomplete:*' insert-unambiguous yes # autocomplete just the common part
zstyle ':autocomplete:*' fzf-completion yes     # use fzf autocomplete
# From https://www.reddit.com/r/zsh/comments/wxlmjo/configure_up_arrow_to_get_last_command_from_this/
setopt NO_SHARE_HISTORY
setopt auto_cd

################################################################################
# Aliases
################################################################################
alias cd='z'
alias ls='eza'
alias l='ls -al'
alias ll='ls -l'
alias nvm='fnm'
alias venv='python -m venv'
alias httpserv='python -m http.server'
alias cat='bat'
alias tree='eza --tree'
alias jq="jaq"
alias watch='watch -c'
# Kubernetes releated
alias k='kubectl'
alias kget='kubectl get'
alias kdel='kubectl delete'
alias kdesc='kubectl describe'
alias klogs='kubectl logs'
alias kedit='kubectl edit'
alias krestart='kubectl rollout restart deployment'

################################################################################
# Plugins
################################################################################
source "$DEMETER/backup/.config/zsh/os/$(uname).zsh"
source "$DEMETER/submodules/ohmyzsh/lib/"{completion,clipboard,directories,history}.zsh
source "$DEMETER/submodules/ohmyzsh/plugins/"{fzf/fzf,kubectl/kubectl}.plugin.zsh
source "$DEMETER/submodules/zsh-autopair/autopair.zsh"
source "$DEMETER/backup/.config/zsh/.iterm2_shell_integration.zsh"
source "$DEMETER/submodules/powerlevel10k/powerlevel10k.zsh-theme"
source "$DEMETER/submodules/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

eval "$(zoxide init zsh)"
