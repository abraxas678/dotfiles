#! /bin/bash
mkdir -p /home/abrax/tmp/
cd /home/abrax/tmp/
# Create the $HOME/opt destination folder
mkdir -p ~/opt
# Download the AppImage inside it
wget -O ~/opt/Espanso.AppImage 'https://github.com/espanso/espanso/releases/download/v2.2.1/Espanso-X11.AppImage'
# Make it executable
chmod u+x ~/opt/Espanso.AppImage
# Create the "espanso" command alias
sudo ~/opt/Espanso.AppImage env-path register
# Register espanso as a systemd service (required only once)
espanso service register

# Start espanso
espanso start
