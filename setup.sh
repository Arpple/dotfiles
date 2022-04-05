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

# i3
rm ~/.config/i3/config
ln -s "$PWD/i3.config" ~/.config/i3/config
