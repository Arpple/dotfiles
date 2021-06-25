#!/usr/bin/env bash

mkdir -p ~/.xmonad
ln -s "$PWD/xmonad/xmonad.hs" $HOME/.xmonad/xmonad.hs
xmonad --recompile
