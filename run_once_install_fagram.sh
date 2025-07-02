#!/bin/bash
if [[ $(hostname) = *"nuc"* ]]; then
if [[ ! -f /usr/bin/fagram ]]; then
URL=$($HOME/tmp/public/github_latest_release_url.sh FajoX1 fagramdesktop | tail -n 1)
wget $URL
sudo apt update
sudo apt install ./$(basename $URL) -y
fi
fi
