#!/bin/bash
sudo chown abrax: -R /home/abrax/.config/pcopy
if [[ ! -f /home/abrax/.ssh/smbcredentials.txt ]]; then
  sudo ln /etc/smbcredentials.txt ~/.ssh/ -s
fi
echo ""
