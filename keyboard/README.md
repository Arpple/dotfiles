# Keyboard
this module provide
- keyboard input for EN/JP/TH
- auto complete style for JP (similar to Windows IME)

## Info
- `fcitx5` input method that support auto complete style for JP input. use this instead of default KDE keyboard layout
- `mozc` japanese input for fcitx5

## Usage
- `Alt + Shift` for change input method
- `Ctrl + Space` for suggest JP word

## Setup

### Install fonts
``` sh
yay -S noto-fonts noto-fonts-cjk noto-fonts-emoji
```

### Link font config
this font config set prefer Thai font to be Noto Serif Thai instead of system default (Droid Sans)

``` sh
mkdir -p ~/.config/fontconfig
ln -s "$PWD/fonts.conf" ~/.config/fontconfig/fonts.conf
```

### Install fcitx5
``` sh
yay -S fcitx5-im fcitx5-mozc fcitx5-configtool
```

### Setup Environment Variable
add these lines to `~/.xprofile` for fcitx5

``` sh
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```


### Auto start fcitx5
for KDE
- open **System Settings** > **Autostart** 
- **Add New** > **Application**
- select `fcitx5`
- (optional) rename it to `Fcitx5 Input Method`
- may need to reboot

### Link fcitx5 config
``` sh
mkdir -p ~/.config
ln -s "$PWD/fcitx5" ~/.config/fcitx5
```

