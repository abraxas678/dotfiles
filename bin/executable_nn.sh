#!/bin/bash
v1="$1"
# Define color codes
BLUE='\033[0;34m'
GREEN='\033[0;32m'
GRAY='\033[1;30m'
RED='\033[0;31m'
NC='\033[0m'

OWNER="$(ls -la $1 | awk '{print $3}')"
BASENAME="$(basename "${1%.*}" | sed 's/^\.//')"
EXTENSION="${1##*.}"

echo -e "${BLUE}┌────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${NC} ${GREEN}File Information${NC}"
echo -e "${BLUE}│${NC} ${GRAY}Owner:${NC}      $OWNER"
echo -e "${BLUE}│${NC} ${GRAY}Base name:${NC}   $BASENAME" 
echo -e "${BLUE}│${NC} ${GRAY}Extension:${NC}   $EXTENSION"
echo -e "${BLUE}└─➤${NC} ${GRAY}Processing file...${NC}"
echo ""


if [[ $(/home/abrax/bin/chezmoi managed | grep -v grep | grep -E ".*$BASENAME.*$EXTENSION.*" | wc -l) -gt 0 ]]; then
    echo -e "${BLUE}┌────────────────────────────────────────────────┐${NC}"
    echo -e "${BLUE}│${NC} ${GREEN}Chezmoi File Check${NC}"
    echo -e "${BLUE}│${NC} ${GRAY}File:${NC}         $v1"
    echo -e "${BLUE}└─➤${NC} ${GRAY}Opening with chezmoi...${NC}"
    echo ""
    sleep 3
    chezmoi edit "$1"
    exit 0
fi

if [[ $OWNER != $USER ]]; then
    echo -e "${BLUE}┌────────────────────────────────────────────────┐${NC}"
    echo -e "${BLUE}│${NC} ${GREEN}File Access Check${NC}"
    echo -e "${BLUE}│${NC} ${GRAY}File:${NC}         $v1"
    echo -e "${BLUE}│${NC} ${GRAY}File owner:${NC}    $OWNER"
    echo -e "${BLUE}│${NC} ${GRAY}Current user:${NC}  $USER"
    echo -e "${RED}└─➤${NC} ${GRAY}Sudo access required${NC}"
    echo ""
    
    echo -e "${BLUE}┌────────────────────────────────────────────────┐${NC}"
    echo -e "${BLUE}│${NC} ${GREEN}Sudo Confirmation${NC}"
    echo -e "${BLUE}│${NC} ${GRAY}Do you want to open this file with sudo privileges?${NC}"
    echo -ne "${BLUE}└─➤${NC} ${GRAY}Enter [y/N]:${NC} "
    tput civis  # Hide cursor
    read -n 1 confirm
    tput cnorm  # Show cursor
    echo ""     # New line after input
    
    if [[ $confirm =~ ^[Yy]$ ]]; then
        echo -e "${RED}└─➤${NC} ${GRAY}Launching with sudo privileges...${NC}"
        sleep 1
        sudo nano "$1"
    else
        echo -e "${GREEN}└─➤${NC} ${GRAY}Operation cancelled${NC}"
        exit 1
    fi
else
    echo -e "${BLUE}┌────────────────────────────────────────────────┐${NC}"
    echo -e "${BLUE}│${NC} ${GREEN}File Access Check${NC}"
    echo -e "${BLUE}│${NC} ${GRAY}File:${NC}         $v1"
    echo -e "${GREEN}└─➤${NC} ${GRAY}Opening file with standard privileges...${NC}"
    echo ""
    nano "$1"
fi
