# Steam
this module provide
- setup Steam and related tools
- how to config GPU (Nvidia) for gaming
- how to run Steam game with compatibility


## Setup

### Enable Multilib
need to enable this package repo first before you can install Steam

edit `/etc/pacman.conf`, uncomment multilib section. 

```ini
[multilib]
Include = /etc/pacman.d/mirrorlist
```

### Install GPU driver (Nvidia)
use `nvidia-open-dkms` instead of `nvidia` or `nvidia-dkms` because it update more frequent

``` sh
yay -S nvidia-open-dkms nvidia-settings nvidia-utils lib32-nvidia-utils lib32-opencl-nvidia opencl-nvidia libvdpau libxnvctrl vulkan-icd-loader lib32-vulkan-icd-loader
```

reboot after

### Steam and tools

#### Install Steam
``` sh
yay -S steam
```

#### Auto start Steam
auto start steam in background
- open **System Settings** > **Autostart**
- **Add New** > **Application**
- select `Steam (Runtime)`
- set config for newly added Steam > **Application**
- change **Arguments** to `%U -silent`

#### Install Proton
- Proton is compatibility tool to run Windows game in Linux.
- Protonup-Qt is version manager for Proton
- Proton-GE is a custom version of Proton that is optimized

``` sh
yay -S protonup-qt-bin
```

run Protonup-Qt application and select **Add version** > **GE-Proton**

#### Install Gamemode
Gamemode is program for optimize things for running application (game)
- [Arch Wiki](https://wiki.archlinux.org/title/GameMode)

``` sh
yay -S gamemode lib32-gamemode
```

## Run steam game

### Set global compatibility
set Steam to run game with Proton-GE by default globally
- in Steam, open **Settings** > **Compatibility**
- toggle **Enable Steam Play for all other titles** = Enable
- select **Run other titles with** = Proton-GE

### Set game option
for each game, set it to run with Gamemode 
- select game, right click > **Properties...**
- in **General** add **LAUNCH OPTIONS** `LD_PRELOAD="" gamemoderun %command%`
``` sh
LD_PRELOAD="" gamemoderun %command%
```

`LD_PRELOAD=""` has something to do with overlay. add this if you find game stuttering after running for a while.

### Linux native game
for game that can be run by native Linux, need to overide global compatibility usin `Steam-Play-None`
- install `Steam-Play-None` from Protonup-Qt > Add version
- select game in Steam library, right click > **Properties...**
- in **Compatibility** enable `Force the use of a specific Steam Play compatibility tool` > select `Steam-Play-None`
