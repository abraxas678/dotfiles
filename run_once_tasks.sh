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

### BWS
if ! command -v bws >/dev/null 2>&1; then
    wget https://github.com/bitwarden/sdk/releases/download/bws-v1.0.0/bws-x86_64-unknown-linux-gnu-1.0.0.zip
    unzip bws-x86_64-unknown-linux-gnu-1.0.0.zip
    sudo mv bws /usr/bin/
    rm -f bws-x86_64-unknown-linux-gnu-1.0.0.zip
    bws config server-base https://vault.bitwarden.eu
    sudo apt install zellij -y
fi

chmod 700 ~/.ssh
chmod 600 ~/.ssh/*

#sudo /home/abrax/bin/setup_automount_nfs.sh
