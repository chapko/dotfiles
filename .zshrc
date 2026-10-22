autoload -Uz promptinit
autoload -Uz compinit

setopt complete_in_word # Complete from both ends of a word.
setopt always_to_end    # Move cursor to the end of a completed word.
setopt auto_menu        # Show completion menu on a successive tab press.
setopt auto_list        # Automatically list choices on ambiguous completion.
setopt auto_param_slash # If completed parameter is a directory, add a trailing slash.
setopt extended_glob    # Needed for file modification glob modifiers with compinit
unsetopt menu_complete  # Do not autoselect the first completion entry.
unsetopt flow_control   # Disable start/stop characters in shell editor.

setopt auto_cd

export ZSH="$HOME/.zsh"

# setup zsh cache dir for for omz completions
export ZSH_CACHE_DIR="${ZSH}/cache"
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)$ZSH_CACHE_DIR/completions]} )) || fpath=("$ZSH_CACHE_DIR/completions" "${fpath[@]}")

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

if type mise &>/dev/null; then
    source <(mise activate zsh)
fi

if type zoxide &>/dev/null; then
    source <(zoxide init zsh --cmd z --hook pwd)
fi

if type gh &>/dev/null; then
    source <(gh completion -s zsh)
fi

if type pnpm &>/dev/null; then
    export PNPM_HOME="$HOME/.local/share/pnpm"
    export PATH="$PNPM_HOME/bin:$PATH"
    source <(pnpm completion zsh)
fi

if type fzf &>/dev/null; then
    source <(fzf --zsh)
fi

if type uv &>/dev/null; then
    # uv shell completion generation is kinda slow, caching it is x3-4 times faster
    local version="${$(uv --version)[(w)2]}"
    local completion_file="$HOME/.local/share/zsh/uv@${version}.completion.zsh"
    if [[ ! -f "$completion_file" ]]; then
        mkdir -p "$(dirname "$completion_file")"
        uv generate-shell-completion zsh > "$completion_file"
    fi
    source "$completion_file"
fi

# local config
if [[ -f "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi

# gpg pinentry in vscode
if [[ -n "$VSCODE_INJECTION" ]]; then
    export GPG_TTY=$(tty)
fi
