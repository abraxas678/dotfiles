#!/bin/bash

# Color Definitions
BLUE='\033[0;34m'
GREEN='\033[0;32m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

echo -e "${BLUE}┌─ Script Initialization${NC}"
echo -e "${BLUE}│${NC} Starting package update and installation process."
echo -e "${BLUE}└─➤${NC}"

echo -e "${BLUE}┌─ Updating Package Lists${NC}"
echo -e "${BLUE}└─➤${NC}"
if sudo apt-get update; then
    echo -e "${GREEN}✔ Package lists updated successfully.${NC}"
else
    echo -e "${GRAY}➤ Failed to update package lists.${NC}"
    exit 1
fi
echo
echo -e "${BLUE}┌─ Installing Packages${NC}"
echo -e "${BLUE}│${NC} ${GRAY}$@${NC}"
echo -e "${BLUE}└─➤${NC}"
if sudo apt-get install -y "$@"; then
    echo -e "${GREEN}✔ Packages installed successfully.${NC}"
else
    echo -e "${RED}➤ Failed to install packages.${NC}"
    exit 1
fi

echo -e "${GREEN}All tasks completed successfully.${NC}"
