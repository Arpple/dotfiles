# start X at login
set fish_greeting
set -xg PATH ~/.config/emacs/bin $PATH
set -xg PATH ~/.emacs.d/bin $PATH
set -xg PATH ~/.dotnet/tools $PATH
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
  status --is-interactive; and nodenv init - fish | source
end

# load luarocks
set -xg LUA_PATH "/usr/share/lua/5.4/?.lua;;/home/arpple/.luarocks/share/lua/5.4/?.lua;/home/arpple/.luarocks/share/lua/5.4/?/init.lua;/usr/share/lua/5.4/?/init.lua"
set -xg LUA_CPATH "/usr/local/lib/lua/5.4/?.so;/usr/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;/usr/lib/lua/5.4/loadall.so;./?.so;/home/arpple/.luarocks/lib/lua/5.4/?.so"
