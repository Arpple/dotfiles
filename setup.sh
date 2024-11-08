#!/usr/bin/env sh

# fish
FISH_FILE=~/.config/fish/config.fish
mkdir -p ~/.config/fish
if [ -f "$FISH_FILE" ]; then
	rm $FISH_FILE
fi
ln -s "$PWD/config.fish" $FISH_FILE

# alacritty
ALACRITTY_DIR=~/.config/alacritty
if [ -d "$ALACRITTY_DIR" ]; then
	rm -r $ALACRITTY_DIR
fi
mkdir -p $ALACRITTY_DIR
ln -s "$PWD/alacritty.yml" $ALACRITTY_DIR/alacritty.yml

# starship
STARSHIP_FILE=~/.config/starship.toml
if [ -f "$STARSHIP_FILE" ]; then
	rm $STARSHIP_FILE
fi
ln -s "$PWD/starship.toml" $STARSHIP_FILE

# doom
DOOM_DIR=~/.config/doom
if [ -d "$DOOM_DIR" ]; then
	rm -r $DOOM_DIR
fi
ln -s "$PWD/doom.d" $DOOM_DIR

# i3
I3_FILE=~/.config/i3/config
mkdir -p ~/.config/i3
if [ -f "$I3_FILE" ]; then
	rm $I3_FILE
fi
ln -s "$PWD/i3.config" $I3_FILE

# polybar
POLYBAR_FILE=~/.config/polybar/config
POLYBAR_FILE2=~/.config/polybar/config.ini
POLYBAR_FILE_SH=~/.config/polybar/launch.sh
mkdir -p ~/.config/polybar
if [ -f "$POLYBAR_FILE" ]; then
	rm $POLYBAR_FILE
fi
if [ -f "$POLYBAR_FILE2" ]; then
	rm $POLYBAR_FILE2
fi
if [ -f "$POLYBAR_FILE_SH" ]; then
	rm $POLYBAR_FILE_SH
fi

ln -s "$PWD/polybar.ini" $POLYBAR_FILE2
ln -s "$PWD/polybar.sh" $POLYBAR_FILE_SH
