#!/bin/bash
# Define color codes
BLUE='\033[0;34m'
GREEN='\033[0;32m'
GRAY='\033[1;30m'
NC='\033[0m'

# Check if mount point exists
MOUNT_PATH="/mnt/webdav/tsdrive/abraxas678@gmail.com"

echo -e "${BLUE}┌────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${NC} Checking WebDAV Mount Status            ${BLUE}│${NC}"

if [ ! -d "$MOUNT_PATH" ]; then
    echo -e "${BLUE}└─➤${NC} ${GRAY}Mount point not found, setting up...${NC}"
    /home/abrax/bin/setup_automount_tsdrive.sh
else
    echo -e "${BLUE}└─➤${NC} ${GREEN}Mount point exists${NC}"
fi