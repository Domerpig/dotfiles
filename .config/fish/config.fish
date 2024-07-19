if status is-interactive
    zoxide init fish | source
    starship init fish | source

    # Aliases
    alias cd="z"
    alias dotfiles="git --git-dir=/home/dominik/.dotfiles/ --work-tree=/home/dominik/"
    alias cargo_update="cargo install --locked --force $(cargo install --list | grep -Eo '^[^ ]+')"
end

