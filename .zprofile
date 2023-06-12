export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# required for lazygit
export COLORTERM=truecolor

export LANG=en_US.UTF-8
export EDITOR=nvim
export GPG_TTY=$(tty)      # https://stackoverflow.com/a/40528629

export BAT_THEME="Solarized (light)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
