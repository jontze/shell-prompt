#!/bin/bash

set -e

echo "The following command executes the starship installation script of https://starship.rs"
read -p "Install starship? (y/n) " -n 1 -r
echo # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
    curl -sS https://starship.rs/install.sh | sh
fi

echo "---------------------------------------------------------------------------"
read -p "Setup starship in your shell '${SHELL}'? (y/n) " -n 1 -r
echo # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
    touch ~/.zshrc
    echo 'eval "$(starship init zsh)"' >>~/.zshrc
fi

echo "--------------------------------------------------------------------------"
echo "Install prompt..."
mkdir -p ~/.config && cp -i starship.toml ~/.config/starship.toml
