if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    tmux new-session # do not exec to be able to exit from tmux to the zsh
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/eugene/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

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
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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

plugins=(z fzf vi-mode docker docker-compose dotenv nvm)

source $ZSH/oh-my-zsh.sh

# User configuration
# ==================

# Theme
# -----

PROMPT='
%{$fg_bold[gray]%}%~%{$fg_bold[blue]%}%{$fg_bold[blue]%} % %{$reset_color%} $(vi_mode_prompt_info)$(git_prompt_info)
%{%(!.${fg[red]}!.${fg[green]})%}» %{$reset_color%}'
PROMPT2='%{%(!.${fg[red]}!.${fg[green]})%}«%{$reset_color%} '
RPROMPT='%{$fg[green]%}[node v$(nvm_prompt_info)]%{$reset_color%} %(0?.%{$fg[green]%}✔.%{$fg[red]%}E:%?)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}] %{$fg[red]%}✖ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}] %{$fg[green]%}✔%{$reset_color%}"
# MODE_INDICATOR="%{$fg_bold[blue]%}"
MODE_INDICATOR="%{$fg_bold[magenta]%}[vi] %{$reset_color%}"

LS_COLORS='di=34:ln=35:so=32:pi=33:ex=32:bd=30;46:cd=30;43:su=30;41:sg=30;44:tw=30;42:ow=30;45:'

export EDITOR=nvim

# https://stackoverflow.com/a/40528629
export GPG_TTY=$(tty)

# Pass all aliases to `sudo`
# http://serverfault.com/a/178956/253138
alias sudo="sudo "

# prevent accidental overwriting
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias e="$EDITOR"

alias gitp="git"
alias qgit="git"

export LANG=en_US.UTF-8
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"

zstyle ':completion:*' verbose true # display completions with descriptions
zstyle ':completion:*' matcher-list '' 'r:|=*' 'l:|=* r:|=*'

# nvm
zstyle ':omz:plugins:nvm' autoload yes
zstyle ':omz:plugins:nvm' lazy yes

# eval "$(pyenv init -)"

# pnpm
export PNPM_HOME="/home/eugene/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# Load Angular CLI autocompletion.
# source <(ng completion script)

if [[ -f "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi
