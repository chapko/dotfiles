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


source "${HOME}/.antidote/antidote.zsh"
antidote load

compinit
handle_completion_insecurities &|

# export COLORTERM=truecolor
export LANG=en_US.UTF-8
export EDITOR=nvim
export GPG_TTY=$(tty)      # https://stackoverflow.com/a/40528629
export BAT_THEME="Solarized (light)"

WORDCHARS=''

source "${HOME}/.zsh/aliases.zsh"
source "${HOME}/.zsh/completion.zsh"
source "${HOME}/.zsh/functions.zsh"
source "${HOME}/.zsh/history.zsh"
source "${HOME}/.zsh/prompt.zsh"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# z
eval "$(zoxide init zsh --cmd z --hook pwd)"

# nvm
export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
    source "$NVM_DIR/nvm.sh"
fi
