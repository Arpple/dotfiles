#!/usr/bin/env sh

# fish
rm ~/.config/fish/config.fish
ln -s "$PWD/config.fish" ~/.config/fish/config.fish

# alacritty
rm -r ~/.config/alacritty
mkdir -p ~/.config/alacritty
ln -s "$PWD/alacritty.yml" ~/.config/alacritty/alacritty.yml

# starship
rm ~/.config/starship.toml
ln -s "$PWD/starship.toml" ~/.config/starship.toml

# doom
rm -r ~/.doom.d
ln -s "$PWD/doom.d" ~/.doom.d

# pacman hook
sudo rm /etc/pacman.d/hooks/list-package.hook
sudo ln -s "$PWD/pacman/list-package.hook" /etc/pacman.d/hooks/list-package.hook
