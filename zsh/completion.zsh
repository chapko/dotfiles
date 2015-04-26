# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

compdef sc=systemctl

compdef _git gits=git-status
compdef _git gitd=git-diff
compdef _git gitdl=git-diff
compdef _git gitdc=git-diff
compdef _git gita=git-add

compdef gitp=git
compdef qgit=git
