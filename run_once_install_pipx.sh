#!/bin/bash
sudo apt update
sudo apt install -y pipx
pipx install catt
pipx install apprise
pipx ensurepath

