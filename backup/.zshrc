######################################
# Theme
######################################

ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

######################################
# Interactive config
######################################
# Disable do you wish to see all x posibilities
# https://github.com/marlonrichert/zsh-autocomplete/issues/388
# zstyle ':completion:*' list-prompt   ''
# zstyle ':completion:*' select-prompt ''
zstyle ':completion:*:*:man:*:*' menu select=long search

# Bat theme
export BAT_THEME='base16'
export BAT_STYLE='plain,rule,header-filename,header-filesize'

# ZSH completitions
#export SHELL_COMPLETIONS_DIR="/usr/local/share/zsh/site-functions/"
# zoxide completitions
eval "$(zoxide init zsh)"
export _ZO_ECHO=1

# zsh autocomplete https://github.com/marlonrichert/zsh-autocomplete/blob/main/.zshrc
# zstyle ':autocomplete:*' insert-unambiguous yes # autocomplete just the common part
zstyle ':autocomplete:*' fzf-completion yes     # use fzf autocomplete

# From https://www.reddit.com/r/zsh/comments/wxlmjo/configure_up_arrow_to_get_last_command_from_this/
setopt NO_SHARE_HISTORY

######################################
# Shell integration
######################################
source ~/.config/zsh/.iterm2_shell_integration.zsh

######################################
# OMZ plugins config
######################################

# Avoid syntax higlight to crash console. See this issue on GitHub
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/513
export ZSH_HIGHLIGHT_MAXLENGTH=160

######################################
# Oh My ZSH config
######################################
export ZSH="$HOME/.oh-my-zsh"
DISABLE_UPDATE_PROMPT="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
	rust
	zsh-completions
	fzf
	colored-man-pages 
	fast-syntax-highlighting
	# fzf-tab
	# zsh-autocomplete
	zsh-autopair
)

source $ZSH/oh-my-zsh.sh

######################################
# OS dependent config
######################################
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

######################################
# Aliases
######################################
alias cd='z'
alias ls='exa'
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
