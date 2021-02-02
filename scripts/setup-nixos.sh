#!/usr/bin/env bash

sudo ln -s "$PWD/nixos" /etc/nixos
sudo nixos-rebuild switch
