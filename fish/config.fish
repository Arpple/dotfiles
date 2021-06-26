set fish_greeting
fish_vi_key_bindings
set fish_force_cursor
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx -- -keeptty
  end
end
 
any-nix-shell fish --info-right | source
starship init fish | source

set -xg PATH ~/.emacs.d/bin $PATH
