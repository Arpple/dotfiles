# i3
this module provide
- setup i3 + polybar for minimum environment as VM
- other xorg config related

## Setup
assume base setup is Arch Linux with i3-wm profile

### Install terminal
you may need to setup terminal first, read [terminal](../terminal/README.md) module

### Setup i3
remove default config and link config file
``` sh
rm ~/.config/i3/config
ln -s "$PWD/i3.config" ~/.config/i3/config
```

### Install Rofi
use Rofi as application launcher (Cmd + d)
``` sh
yay -S rofi
```

### Install polybar
not neccessary but if you want status bar, install polybar
``` sh
yay -S polybar
```

link config file
``` sh
mkdir ~/.config/polybar
ln -s "$PWD/polybar.ini" ~/.config/polybar/config.ini
ln -s "$PWD/polybar.sh" ~/.config/polybar/launch.sh
```



