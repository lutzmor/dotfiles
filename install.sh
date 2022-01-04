#!/bin/sh

if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v nix &> /dev/null
then
  curl -L https://nixos.org/nix/install | sh
fi

if ! command -v darwin-rebuild &> /dev/null
then
  nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
  ./result/bin/darwin-installer
fi

mkdir -p ~/.config/

### Install sketchybar
brew tap FelixKratz/formulae
brew install sketchybar
cp -r config/sketchybar ~/.config/
brew services start sketchybar

### Install yabai from head
security add-certificates config/yabai/yabai.pem
brew install koekeishiya/formulae/yabai --HEAD
sudo echo "espo > ALL = (root) NOPASSWD: /usr/local/bin/yabai --load-sa" > /private/ettc/sudoers.d/yabai
cp -r config/yabai ~/.config/
codesign -fs 'yabai-cert' /usr/local/bin/yabai
brew service start yabai
echo "Disable sip and do yabai --install-sa"

nix-build ~/.nixpkgs\#darwinConfiguration.$HOSTNAME.system --extra-experimental-features nix-command --extra-experimental-features flakes
./result/sw/bin/darwin-rebuild switch --flake .#$HOSTNAME
