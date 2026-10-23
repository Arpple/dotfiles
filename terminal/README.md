# Terminal
this modules provide
- terminal app using `ghostty` (`alacritty` config kept as fallback)
- default shell to `fish`
- prompt decoration with `starship`

## Setup
install all programs
``` sh
yay -S ghostty alacritty fish starship nerd-fonts
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
mkdir -p ~/.config/fish ~/.config/alacritty ~/.config/ghostty

rm ~/.config/fish/config.fish
rm -r ~/.config/fish/functions
ln -s "$PWD/config.fish" ~/.config/fish/config.fish
mkdir ~/.config/fish/functions
ln -s "$PWD/functions/v.fish" ~/.config/fish/functions/v.fish

rm ~/.config/alacritty/alacritty.toml
ln -s "$PWD/alacritty.toml" ~/.config/alacritty/alacritty.toml

rm ~/.config/ghostty/config
ln -s "$PWD/ghostty.config" ~/.config/ghostty/config
rm ~/.config/ghostty/ghostty.css
ln -s "$PWD/ghostty.css" ~/.config/ghostty/ghostty.css

rm ~/.config/starship.toml
ln -s "$PWD/starship.toml" ~/.config/starship.toml
```

