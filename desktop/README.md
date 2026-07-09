varios desktop setting and installation

# Rofi
application launcher

install
```sh
yay -S rofi
```

create keyboard shortcut and make it run this command
```sh
rofi -show drun -theme Monokai -icon-theme "Tela-circle" -show-icons
```


# KWallet
wallet use to store secret and password. to stop it from asking every times.

install wallet manager
```sh
yay -S kwalletmanager
```

- Open System Settings and type KWallet or Wallet into the search bar.
- Go to Wallet Preferences.
- Uncheck the box labeled "Enable the KDE wallet subsystem".
- Click Apply

# Sound 

## Easy Effect
sound and volume effect use to apply noise canceling program

```
yay -S easyeffects libdeep_filter_ladspa-bin
```

add `Echo Canceller` and `Deep Noise Remover`. always use `Easy Effect Source` as input insted of mic directly


# Mount Share HDD
to auto mount HDD shared with Windows

## Windows Fast Startup
disable Fast Startup in Windows Power Options before accessing the partition from Linux to avoid "unclean" filesystem errors.

## Mount
identify disk and note the UUID
```sh
lsblk -f
sudo blkid
```

create mount point
```sh
sudo mkdir -p /mnt/data
```

config auto mount in `/etc/fstab` add
```sh
# Shared Windows NTFS HDD
UUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  /mnt/data  ntfs-3g  defaults,uid=1000,gid=1000,umask=0022,windows_names  0  0
```

# Video
install vlc and plugin
```sh
yay -S vlc vlc-plugins-all
```
