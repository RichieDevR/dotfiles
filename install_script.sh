#!/bin/bash

# TODO: add install for neovim on Arch and Ubuntu/Debian,
# as well as linking and installing other dependencies
# for dotfiles on all three OS.

# Check the OS distribution
if [ "$(cat /etc/os-release | grep -E 'ID=(debian|ubuntu)')" ]; then
	# Install Rust using rustup & zsh on Debian/Ubuntu
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	apt-get update -y
	apt-get install zsh -y
elif [ "$(cat /etc/os-release | grep -E 'ID=arch')" ]; then
	# Install Rust using rustup & zsh on Arch Linux
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	pacman -Syu
	pacman -Sy --noconfirm zsh
elif [ "$(cat /etc/os-release | grep -E 'ID=(centos|fedora|rhel)')" ]; then
	# Install Rust using rustup, zsh, & neovim on RPM-based systems
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	dnf install -y zsh
	dnf install -y neovim
else
	echo "Unsupported OS distribution"
	exit 1
fi

# Create symlinks for specified files
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh ~/.zsh
