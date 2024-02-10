if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    alias ll="ls -l"
    alias dotfiles="git --git-dir=/home/dominik/.dotfiles/ --work-tree=/home/dominik/"
end
