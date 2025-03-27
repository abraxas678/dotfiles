#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
ORANGE='\033[0;33m'
GREY='\033[0;37m'
LIGHT_BLUE='\033[1;34m'
RESET='\033[0m'
RC='\033[0m'

### did anythign get piped into?
 if [ -t 0 ]; then
   PIPE=0
 else
   PIPE=1
   echo -e "${RED}$(cat)${NC}"
 fi


