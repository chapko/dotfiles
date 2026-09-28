alias sudo="sudo " # http://serverfault.com/a/178956/253138
# prevent accidental overwriting
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"

alias gitp="git"
alias qgit="git"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias ls='ls --color=tty'

alias task='go-task'

if command -v eza &> /dev/null; then
  alias ll='eza -lhga --group-directories-first --icons=auto'
  alias lt='ll --tree --level=2 --long'
else
  alias ll='ls -lAh'
  alias lt='ll -R'
fi

alias lg='TERM=screen-256color lazygit'

alias sc='systemctl'
alias xcb='xclip -selection clipboard'
