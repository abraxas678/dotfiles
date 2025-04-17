#!/bin/bash
if [[ $(hostname) = *"nuc"* ]]; then
URL=$(github_latest_release_url.sh FajoX1 fagramdesktop)
wget $URL
sudo apt update
sudo apt install ./$(basename $URL)
fi
