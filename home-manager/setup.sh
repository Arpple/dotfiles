#!/usr/bin/env bash

rm ~/.config/nixpkgs/home.nix
ln -s "$PWD/home-manager/home.nix" $HOME/.config/nixpkgs/home.nix

home-manager switch
