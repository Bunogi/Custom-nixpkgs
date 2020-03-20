autoload -U promptinit colors
promptinit
colors

function zsh_prompt() {
    echo '%F{red}%T%f | %F{yellow}%M%f | %F{green}%B%~%f%b'
    echo -n '%{%(?.%K{green}.%K{red})%} %k %{%G%B%(!.%F{red}#%f.$)%b%}: '
}

prompt default
setopt promptsubst
PS1='$(zsh_prompt)'
