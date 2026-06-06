# Keyboard
this module provide
- keyboard input for EN/JP/TH
- auto complete style for JP (similar to Windows IME)

## Setup

### Fonts

#### Install fonts
install fonts that support JP/TH 
``` sh
yay -S noto-fonts noto-fonts-cjk noto-fonts-emoji
```

#### Link font config
this font config set prefer Thai font to be Noto Serif Thai instead of system default (Droid Sans)

``` sh
mkdir -p ~/.config/fontconfig
ln -s "$PWD/fonts.conf" ~/.config/fontconfig/fonts.conf
```

### Input Method
use `fcitx5` input method instead of using default KDE keyboard layout. this support auto complete hint style for JP input similar to Windows IME (auto convert romaji to Hiragana/Kanji)

#### Install fcitx5
``` sh
yay -S fcitx5-im fcitx5-mozc fcitx5-configtool
```

#### Setup Environment Variable
add these lines to `~/.xprofile` for fcitx5

``` sh
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```


#### Auto start fcitx5
for KDE
- open **Autostart** 
- Add New > Application
- select fcitx5
- (optional) rename it to `Fcitx5 Input Method`
- may need to reboot

#### Link fcitx5 config
``` sh
mkdir -p ~/.config
ln -s "$PWD/fcitx5" ~/.config/fcitx5
```

## Ergo68
the split [keyboard](https://shop.yushakobo.jp/products/ergo68?_pos=1&_sid=aa321d6f9&_ss=r) I'm using.

remap using this [website](https://remap-keys.app/configure) (use chrome/brave, not work with zen browser)

sometimes it may not detect keyboard, fix permission with
```sh
sudo chmod 666 /dev/hidraw*
```
