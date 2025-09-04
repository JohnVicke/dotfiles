#!/usr/bin/env bash

echo "installing nix"

sh <(curl -L https://nixos.org/nix/install)
. "$HOME/.nix-profile/etc/profile.d/nix.sh"

echo "adding home manager..."

nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager
nix-channel --update

echo "enabling experimental-features"
mkdir -p ~/.config/nix/
echo "experimental-features = nix-command flakes" >~/.config/nix/nix.conf
