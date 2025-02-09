#!/bin/sh

if [ ! -f "/home/abrax/.config/chezmoi/key.txt" ]; then
    mkdir -p "/home/abrax/.config/chezmoi"
    chezmoi age decrypt --output "/home/abrax/.config/chezmoi/key.txt" --passphrase "/home/abrax/.local/share/chezmoi/key.txt.age"
    chmod 600 "/home/abrax/.config/chezmoi/key.txt"
fi

