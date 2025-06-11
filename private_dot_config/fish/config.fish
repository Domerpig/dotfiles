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
    alias ca="chezmoi apply -v"
    alias ccd="chezmoi cd"
    alias gc="git commit -m"
    alias ga="git add"
    alias gs="git status"
    alias gp="git pull"
    alias gP="git push"
    alias gd="git diff"
    # eval (zellij setup --generate-auto-start fish | string collect)
end

