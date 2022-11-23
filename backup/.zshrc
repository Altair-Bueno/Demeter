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
# Performance related
######################################

# Performance analisis
# zmodload zsh/zprof

# Disable magic functions
#https://github.com/ohmyzsh/ohmyzsh/issues/5569
DISABLE_MAGIC_FUNCTIONS=true

# Disable compinit to improve performance
skip_global_compinit=1

######################################
# Interactive config
######################################
# Disable do you wish to see all x posibilities
# https://github.com/marlonrichert/zsh-autocomplete/issues/388
# zstyle ':completion:*' list-prompt   ''
# zstyle ':completion:*' select-prompt ''
zstyle ':completion:*:*:man:*:*' menu select=long search

# Disable some less nonsense
export LESSHISTFILE=-

# Bat theme
export BAT_THEME='base16'

# Allow mousewheel scroll on bat
# https://github.com/sharkdp/bat/issues/188
# https://github.com/sharkdp/bat#using-a-different-pager
# export BAT_PAGER='less -RFX'

# ZSH completitions
#export SHELL_COMPLETIONS_DIR="/usr/local/share/zsh/site-functions/"
# zoxide completitions
eval "$(zoxide init zsh)"
export _ZO_ECHO=1

# zsh autocomplete https://github.com/marlonrichert/zsh-autocomplete/blob/main/.zshrc
# zstyle ':autocomplete:*' insert-unambiguous yes # autocomplete just the common part
zstyle ':autocomplete:*' fzf-completion yes     # use fzf autocomplete

# Move .zcomdump files to cache folder
export ZSH_COMPDUMP="$HOME/.cache/zsh/.zcomdump-$(zsh --version)"

# From https://www.reddit.com/r/zsh/comments/wxlmjo/configure_up_arrow_to_get_last_command_from_this/
setopt NO_SHARE_HISTORY
######################################
# iTerm2
######################################
source ~/.iterm2_shell_integration.zsh

######################################
# OMZ plugins config
######################################

# Avoid syntax higlight to crash console. See this issue on GitHub
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/513
export ZSH_HIGHLIGHT_MAXLENGTH=160

######################################
# Oh My ZSH config
######################################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Other config
alias cd='z'
alias ls='exa'
alias tree='ls --tree'

