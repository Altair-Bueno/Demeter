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
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.history"
HISTSIZE=1000
SAVEHIST=1000
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
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
setopt AUTO_CD
setopt HIST_IGNORE_SPACE
setopt appendhistory
setopt PUSHD_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
# Setup completitions
autoload -U compinit
compinit -u -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcomdump-$ZSH_VERSION"
skip_global_compinit=1

################################################################################
# Aliases
################################################################################
alias cd='z'
alias ls='eza'
alias l='ls -al'
alias ll='ls -l'
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
plugins=(
  "$DEMETER/backup/.config/zsh/os/$(uname).zsh"
  "$DEMETER/submodules/ohmyzsh/lib/"{completion,clipboard,directories,history}.zsh
  "$DEMETER/submodules/ohmyzsh/plugins/"{fzf/fzf,kubectl/kubectl}.plugin.zsh
  "$DEMETER/submodules/zsh-autopair/autopair.zsh"
  "$DEMETER/backup/.config/zsh/.iterm2_shell_integration.zsh"
  "$DEMETER/submodules/powerlevel10k/powerlevel10k.zsh-theme"
  "$DEMETER/submodules/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
  "$DEMETER/submodules/zsh-no-ps2/zsh-no-ps2.plugin.zsh"
  "$DEMETER/submodules/fzf-tab/fzf-tab.plugin.zsh"
)
for plugin in $plugins 
do
  source "$plugin"
done

eval "$(zoxide init zsh)"
