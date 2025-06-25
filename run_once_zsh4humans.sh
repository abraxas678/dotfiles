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

chmod 700 ~/.ssh
chmod 600 ~/.ssh/*

#sudo /home/abrax/bin/setup_automount_nfs.sh
sudo cp /usr/local/bin/zsh /usr/bin/zsh
