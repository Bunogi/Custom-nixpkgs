autoload -U promptinit colors
promptinit
colors

function zsh_prompt_ssh() {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        echo -n "%F{magenta}%f  "
    fi
}

function zsh_prompt() {
    echo -n '%F{red}%T%f | '
    echo -n '%F{blue}%n%f@%F{__HOST_COLOR__}%M%f '
    zsh_prompt_ssh
    echo '| %F{green}%B%~%f%b'
    echo -n '%{%(?.%K{green}.%K{red})%} %k %{%G%B%(!.%F{red}#%f.$)%b%}: '
}

prompt default
setopt promptsubst
PS1='$(zsh_prompt)'
