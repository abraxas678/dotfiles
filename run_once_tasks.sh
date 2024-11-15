#!/bin/bash
mkdir -p /home/abrax/tmp/

# Check if zsh is already installed
if ! command -v zsh >/dev/null 2>&1; then
    if command -v curl >/dev/null 2>&1; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
    else
        sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
    fi
fi

# Check if rclone is already installed
if ! command -v rclone >/dev/null 2>&1; then
    sudo -v ; curl https://rclone.org/install.sh | sudo bash -s beta
fi