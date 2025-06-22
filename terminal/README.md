# Terminal
this modules provide
- terminal app using `alacritty`
- default shell to `fish`
- prompt decoration with `starship`

## Setup
install all programs
``` sh
yay -S alacritty fish starship nerd-fonts
```

going into `fish` shell and change to default

``` sh
# from bash
fish

# now in fish, change default shell
chsh -s (which fish)
```

link all config files
``` sh
mkdir -p ~/.config/fish ~/.config/alacritty

rm ~/.config/fish/config.fish
ln -s "$PWD/config.fish" ~/.config/fish/config.fish
ln -s "$PWD/functions/v.fish" ~/.config/fish/functions/v.fish

rm ~/.config/alacritty/alacritty.toml
ln -s "$PWD/alacritty.toml" ~/.config/alacritty/alacritty.toml

rm ~/.config/starship.toml
ln -s "$PWD/starship.toml" ~/.config/starship.toml
```

