################################################################################
# P10k theme
################################################################################
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
P10K_SCRIPT=~/.config/zsh/.p10k.zsh
[[ ! -f "$P10K_SCRIPT" ]] || source "$P10K_SCRIPT"

################################################################################
# Plugins, completitions and shell extensions
################################################################################
autoload -U compinit
compinit -u -d "$HOME/.cache/zsh/.zcomdump-$ZSH_VERSION"
HISTFILE="${XDG_DATA_HOME:-$HOME/.config}/zsh/.history"

eval "$(sheldon source)"
eval "$(zoxide init zsh)"
# eval "$(starship init zsh)"

################################################################################
# Aliases
################################################################################
alias cd='z'
alias ls='exa'
alias l='ls -al'
alias ll='ls -l'
alias nvm='fnm'
# alias iterm='open -a "iterm"'
alias python='python3.11'
# alias pip='python -m pip'
alias venv='python -m venv'
alias neofetch='macchina'
alias exa='exa --icons --sort=type'
alias httpserv='npx http-server'
alias vim='hx'
alias http='xh'
alias https='xhs'
alias cat='bat'
alias tree='exa --tree'

################################################################################
# Finalize 
################################################################################
source "${XDG_DATA_HOME:-$HOME/.config}/zsh/os/$(uname).zsh"

