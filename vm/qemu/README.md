# QEMU/KVM
this module provides
- how to setup VM
- host machine = Arch Linux + QEMU/KVM + Virt Manager
- guest machine = Arch Linux 

## Setup
### Install packages
``` sh
yay -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat libguestfs
```

enable vm service and add user group
``` sh
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo usermod -aG libvirt $USER
```

may need to logout to apply change

### Create VM
- open virt-manager
- create new VM
- don't forget to use /home as storage instead of / as it will fill up space 
- make sure display is set to **Spice** and video is set to **Virtio**
- install Arch Linux

### Setup Guest
install yay package manager
``` sh
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

setup terminal, read [terminal](../../terminal/README.md) 

install guest utils
``` sh
yay -S spice-vdagent qemu-guest-agent
```

you may need to edit service file before you can enable it, run
``` sh
sudo systemctl edit spice-vdagnetd
```

add this
``` ini
[Install]
WantedBy=multi-user.target
```

do the same with `qemu-guest-agent`

then start service
``` sh
sudo systemctl enable --now spice-vdagentd
sudo systemctl enable --now qemu-guest-agent
```

add `spice-vdagent` to auto start, edit `~/.xprofile` and add
``` sh
spice-vdagent &
```

## Auto Resize
if `spice-vdagent` doesn't give auto resize ability, you can setup this script to do it.
this only works in basic environment as it use `~/.XAuthority` file that is managed differently when you
use login/session manager like `ssdm`, `lightdm` or `ly`

in case you use those, just run `x-resize` manually everytime *shrug*

### Detect udev event
to check if spice channel send event on resize or not, run this on guest
``` sh
udevadm monitor
```

this will start monitoring udev event. then try to resize the VM window and see if there is this event
``` 
KERNEL[261.169236] change   /devices/pci0000:00/0000:00:01.0/drm/card1 (drm)
UDEV  [262.177667] change   /devices/pci0000:00/0000:00:01.0/drm/card1 (drm)
```

note the device name (`card1` in this case). 

### Check your display
check display number with
``` sh
echo $DISPLAY
```

this will give you display number. in my case `:0`

### Create resize script
create new script that can manually resize your VM. create `/usr/local/bin/x-resize`
``` sh
#! /bin/sh
export DISPLAY=:0
export XAUTHORITY=/home/arpple/.Xauthority

OUTPUT=$(xrandr | grep -w "connected" | awk '{print $1}')
xrandr --output "$OUTPUT" --auto

# (optional) save log
echo "$(date): Resized display" >> /tmp/resize.log
```

may need to edit
- `DISPLAY=:0` based on your `echo $DISPLAY`
- `XAUTHORITY` path based on your username
- `--output Virtual-1` based on our video output from `xrandr`

give execute permission and test it manually

``` sh
sudo chmod +x /usr/local/bin/x-resize
/usr/local/bin/x-resize
```

### Create udev rule
then create event rule for udev at `/etc/udev/rules.d/50-x-resize.rules`
``` 
SUBSYSTEM=="drm", ACTION=="change", KERNEL="card1", RUN+="/usr/local/bin/x-resize"
```

may need to edit
- `KERNEL="card1"` based on your device

### Test resize
try it
