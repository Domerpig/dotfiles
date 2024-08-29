if status is-interactive
    zoxide init fish | source
    starship init fish | source
    pyenv init - | source

    # Aliases
    alias sudo="sudo "
    alias cd="z"
    alias dotfiles="git --git-dir=/home/dominik/.dotfiles/ --work-tree=/home/dominik/"
    alias cargo_update="cargo install --locked --force $(cargo install --list | grep -Eo '^[^ ]+')"
    # eval (zellij setup --generate-auto-start fish | string collect)
end

