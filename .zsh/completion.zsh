# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Standard-Tags
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Standard-Styles

# :completion:<function>:<completer>:<command>:<argument>:<tag>

# Use ^x? (_complete_debug) to debug completions

zstyle ':completion:*:*:*:*:*' menu select

# case & hyphen insensitive partial-word and substring completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' single-ignored show

zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$HOME/.zsh/cache"

zstyle ':completion:*:*:*:*:globbed-files' list-colors ${LS_COLORS}
zstyle ':completion:*:*:*:*:options' list-colors '=(#b)*(-- *)=34=0' '=*=34'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:*:*:*:heads' list-colors '=(#b)([0-9a-zA-Z/_-]#)*=0=33'
zstyle ':completion:*:*:*:*:commits' list-colors '=(#b)([0-9a-f](#c7,9))*(\(^[\)]#\))=0=31=32'
zstyle ':completion:*:*:*:*:commit-ranges' list-colors '=(#b)([0-9a-f](#c7,9))*(\(^[\)]#\))=0=31=32'

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
    clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
    gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
    ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
    named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
    operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
    rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
    usbmux uucp vcsa wwwrun xfs '_*'
