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
# Plugins and shell extensions
################################################################################
eval "$(sheldon source)"
eval "$(zoxide init zsh)"
# eval "$(starship init zsh)"
source ~/.config/zsh/.iterm2_shell_integration.zsh

################################################################################
# Aliases
################################################################################
alias cd='z'
alias ls='exa'
alias l='ls -l'
alias nvm='fnm'
alias iterm='open -a "iterm"'
alias python='python3.11'
alias pip='python -m pip'
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
# OS dependent config
################################################################################
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

################################################################################
# Finalize 
################################################################################
autoload -U compinit
compinit
