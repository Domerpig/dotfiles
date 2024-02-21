if status is-interactive
    alias dotfiles="git --git-dir=/home/dominik/.dotfiles/ --work-tree=/home/dominik/"

    starship init fish | source
    zoxide init fish | source
end
