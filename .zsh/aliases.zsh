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
alias l='ls -lah'

alias task='go-task'

if command -v eza &> /dev/null; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias l='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
fi

alias lg='TERM=screen-256color lazygit'

alias sc='systemctl'
alias xcb='xclip -selection clipboard'
