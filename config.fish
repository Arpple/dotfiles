set fish_greeting
set -xg PATH ~/.emacs.d/bin $PATH
starship init fish | source
any-nix-shell fish --info-right | source
