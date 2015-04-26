# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='gvim'
fi

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($DOTFILES/functions $fpath)

autoload -U $DOTFILES/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000



setopt hist_ignore_dups     # ignore duplicate commands in history
setopt no_bg_nice           # don't nice background tasks
setopt no_hup               # don't send HUP signal to running jobs when the
                            # shell exits

setopt no_list_beep         # don't beep on ambigious completion
setopt local_options        # allow functions to have local options
setopt local_traps          # allow functions to have local traps

setopt hist_verify          # Whenever the user enters a line with history
                            # expansion, don't execute the line directly;
                            # instead, perform history expansion and reload the
                            # line into the editing buffer.

setopt share_history        # share history between sessions ???
setopt extended_history     # add timestamps to history
setopt prompt_subst
setopt correct
setopt complete_in_word
setopt ignore_eof

setopt append_history       # adds history
setopt inc_append_history   # adds history incrementally
setopt hist_ignore_all_dups # don't record dupes in history
setopt hist_reduce_blanks

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
# alias completions should be defined explicitly (in completion.zsh)
setopt complete_aliases

zle -N newtab

# vi mode
bindkey -v

