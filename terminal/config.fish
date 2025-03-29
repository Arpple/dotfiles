# start X at login
set fish_greeting
set -xg PATH ~/.config/emacs/bin $PATH
set -xg PATH ~/bin $PATH
starship init fish | source

# any-nix-shell fish --info-right | source

# pnpm
set -gx PNPM_HOME "/home/arpple/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# nodenv
if type -q nodenv 
  status --is-interactive; and source (nodenv init -|psub)
end
