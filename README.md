
# Viktor Malmedal Dotfiles

## Getting Started

- install nix
```sh
sh <(curl -L https://nixos.org/nix/install)
```

- install home-manager
```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager
nix-channel --update
```

- enable flakes
```sh
mkdir -p ~/.config/nix/
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
```


