autoload -U colors && colors

# Expand variables and commands in PROMPT variables
setopt prompt_subst

PROMPT='
%{$fg_bold[gray]%}%~%{$fg_bold[blue]%}%{$fg_bold[blue]%} % %{$reset_color%} $(vi_mode_prompt_info)$(_omz_git_prompt_info)
%{%(!.${fg[red]}!.${fg[green]})%}» %{$reset_color%}'

PROMPT2='%{%(!.${fg[red]}!.${fg[green]})%}«%{$reset_color%} '
RPROMPT='%{$fg[green]%}[node $(fnm current)]%{$reset_color%} %(0?.%{$fg[green]%}✓.%{$fg[red]%}E:%?)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}] %{$fg[red]%}✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}] %{$fg[green]%}✓ %{$reset_color%}"
MODE_INDICATOR="%{$fg_bold[magenta]%}[vi] %{$reset_color%}"



