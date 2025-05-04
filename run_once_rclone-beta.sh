#! /bin/bash
# Check if rclone is already installed
if ! command -v rclone >/dev/null 2>&1; then
    sudo -v ; curl https://rclone.org/install.sh | sudo bash -s beta
fi


