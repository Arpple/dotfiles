#!/usr/bin/env bash

rm ~/.config/nixpkgs/home.nix
ln -s "$PWD/home.nix" $HOME/.config/nixpkgs/home.nix

home-manager switch
