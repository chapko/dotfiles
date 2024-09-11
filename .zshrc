if
command -v tmux &> /dev/null &&
[ -n "$PS1" ] &&
[[ ! "$TERM" =~ screen ]] &&
[[ ! "$TERM" =~ tmux ]] &&
[ -z "$TMUX" ] &&
[ -z "$DISABLE_TMUX" ] &&
then
    tmux attach -t default &>/dev/null || tmux new-session -s default # do not exec to be able to exit from tmux to the zsh
fi

autoload -Uz promptinit
autoload -Uz compinit

setopt complete_in_word    # Complete from both ends of a word.
setopt always_to_end       # Move cursor to the end of a completed word.
setopt auto_menu           # Show completion menu on a successive tab press.
setopt auto_list           # Automatically list choices on ambiguous completion.
setopt auto_param_slash    # If completed parameter is a directory, add a trailing slash.
setopt extended_glob       # Needed for file modification glob modifiers with compinit
unsetopt menu_complete     # Do not autoselect the first completion entry.
unsetopt flow_control      # Disable start/stop characters in shell editor.

setopt auto_cd

export ZSH="$HOME/.zsh"

# setup zsh cache dir for for omz completions
export ZSH_CACHE_DIR="${ZSH}/cache"
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)$ZSH_CACHE_DIR/completions]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# configure .local/bin/e folders
export E_PROJECTS_PATH="$HOME/.config:$HOME/workspace"
export E_PROJECTS_DEPTH="1"


# Disable async prompts
# https://github.com/ohmyzsh/ohmyzsh/blob/b8c69d265257fae88fe504ea43cbcf2728bc1308/README.md#disable-async-git-prompt
zstyle ':omz:alpha:lib:git' async-prompt no

source "${HOME}/.antidote/antidote.zsh"
antidote load

compinit
handle_completion_insecurities &|

WORDCHARS=''

source "${HOME}/.zsh/aliases.zsh"
source "${HOME}/.zsh/completion.zsh"
source "${HOME}/.zsh/functions.zsh"
source "${HOME}/.zsh/history.zsh"
source "${HOME}/.zsh/prompt.zsh"


# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
if [[ -f "$HOME/.config/tabtab/zsh/__tabtab.zsh" ]]; then
    source "$HOME/.config/tabtab/zsh/__tabtab.zsh"
fi

# z
eval "$(zoxide init zsh --cmd z --hook pwd)"

# fnm
if type fnm &> /dev/null; then
    eval "$(fnm env)"
fi

# nvm
if [[ -f "$HOME/.nvm/nvm.sh" ]]; then
    source "$HOME/.nvm/nvm.sh"
fi

# local config
if [[ -f "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi
