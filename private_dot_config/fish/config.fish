if status is-interactive
    # disable greeting
    set -U fish_greeting

    zoxide init fish | source
    starship init fish | source
    pyenv init - | source

    # Aliases
    alias cd="z"
    alias cargo_update="cargo install --locked --force $(cargo install --list | grep -Eo '^[^ ]+')"
    alias ce="chezmoi edit"
    # eval (zellij setup --generate-auto-start fish | string collect)
end

