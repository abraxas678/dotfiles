#!/bin/bash

export HASS_SERVER=http://192.168.11.7:8123
export HASS_TOKEN=173f3d8c-de93-4a41-86c4-b222000954bb  ##bws

#PINGME
export GOTIFY_TOKEN=83e200bb-198d-476c-a8d2-b22200090e0d ###bws
export GOTIFY_URL=https://g.cap.yyps.de; 

# Color definitions
BLUE='\033[0;34m'
GREEN='\033[0;32m'
GRAY='\033[38;5;242m'
RED='\033[0;31m'
NC='\033[0m'

# Environment Configuration section
echo -e "${BLUE}┌──────────────────────────────────────${NC}"
echo -e "${BLUE}│  Environment Configuration${NC}"
echo -e "${BLUE}└─➤${NC} ${GRAY}Loaded .env.zsh${NC}"

source <(fzf --zsh)
transfer(){ 
    if [ $# -eq 0 ]; then 
        echo -e "${RED}No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>${NC}" >&2
        return 1
    fi
    if tty -s; then 
        file="$1"
        file_name=$(basename "$file")
        if [ ! -e "$file" ]; then
            echo -e "${RED}$file: No such file or directory${NC}" >&2
            return 1
        fi
        if [ -d "$file" ]; then
            file_name="${file_name}.zip"
            (cd "$file" && zip -r -q - .) | curl --progress-bar --upload-file "-" "https://transfer.sh/${file_name}" | tee /dev/null
        else
            cat "$file" | curl --progress-bar --upload-file "-" "https://transfer.sh/${file_name}" | tee /dev/null
        fi
    else 
        file_name=$1
        curl --progress-bar --upload-file "-" "https://transfer.sh/${file_name}" | tee /dev/null
    fi
}

STATUS=$(sudo systemctl status ntfy_cmd.service | grep -v grep | grep Active)
if [[ $STATUS == *"running"* ]]; then
    echo -e "${BLUE}┌──────────────────────────────────────${NC}"
    echo -e "${BLUE}│  ntfy_cmd Service Status${NC}"
    echo -e "${BLUE}└─➤${NC} ${GREEN}Active and running${NC}"
else
    echo -e "${BLUE}┌──────────────────────────────────────${NC}"
    echo -e "${BLUE}│  ntfy_cmd Service Status${NC}"
    echo -e "${BLUE}└─➤${NC} ${GRAY}Not running${NC}"
fi

export POLYBAR_OFFSET_Y=40
export CLIPBOARD_THEME=ansi
#cd $HOME
EMULATOR="$(ps -p $PPID -o comm=)"

export POP_SMTP_HOST=smtp.ionos.de
export POP_SMTP_PORT=587
export POP_SMTP_USERNAME=delta2@0.yyps.de
#export POP_SMTP_PASSWORD=$(/home/abrax/bin/akg.sh ionos_smtp)

#cat .zshrc

function prev() {
    PREV=$(fc -lrn | head -n 1)
    echo -e "${BLUE}$PREV${NC}" | tee /dev/tty | xsel -b
    # read -t 3 -p "group? --0 in 3s--" ANS
    # cb cp$ANS $PREV
}
function ssu() {
  sudo $(fc -lrn | head -n 1)
}

function prevorg2() {
    PREV=$(fc -lrn | head -n 1)
    sh -c "/home/abrax/bin/snippet-manager.sh add GIVEMEANAME $(printf %q "$PREV")"
}

function prevorg() {
    PREV=$(fc -lrn | head -n 1)
    sh -c "pet new $(printf %q "$PREV")"
}

#cat .zshrc
function pet-select() {
    BUFFER=$(pet search --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle redisplay
}
zle -N pet-select
#stty -ixon
bindkey '^s' pet-select

chmod 600 ~/.ssh/*
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa

getkey() {
    WANT=$1
    RES=$(keepassxc-cli show "/home/abrax/.ssh/ssh.kdbx" -k "/mnt/disroot/SB2/ssh/ssh.keyx" "$WANT" --no-password -y 2:1097617 -a password)
    export "$WANT"="$RES"
}
#read -p "KEE_XC PW: >> " MYKEY
#exit
##if [[ 1 = 2 ]]; then

source /home/abrax/bin/alias2.dat
source /home/abrax/bin/header.sh

if [[ $(hostname) = *"wsl"* ]]; then
    sudo mkdir -p /mnt/f
    sudo mount -t drvfs F: /mnt/f
fi

export RESTIC_REPOSITORY=rclone:sb2:restic9
export TERM=xterm-256color
#export HISHTORY_SERVER=http://localhost:8011
export HISHTORY_SERVER=http://100.93.19.1:8011
export FLYCTL_INSTALL="/home/abrax/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH="$FLYCTL_INSTALL/bin:/home/abrax/.bashhub/bin:$PATH"

##if [[ $(hostname) = *"wsl"* ]]; then
  #export GETPW='/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe keepassxc-cli show -k /home/mnt/nc/sec/NEW_SETUP.keyx /home/mnt/nc/WINDOWS/amdam/ResilioSync/SETUP_NEW/NEW_SETUP.kdbx $WANTPW --no-password -y 1:1097617 -a password'
  #export GETPW='/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe keepassxc-cli show -k /home/mnt/nc/sec/WSL-Passwords.keyx /home/mnt/nc/WINDOWS/amdam/ResilioSync/resilio_encrypted/kee/WSL-Passwords.kdbx $WANTPW --no-password -y 2:1097617 -a password'
#else
  #export GETPW='tailscale ssh abrax@100.95.199.84 /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe keepassxc-cli show -k /home/mnt/nc/sec/NEW_SETUP.keyx /home/mnt/nc/WINDOWS/amdam/ResilioSync/SETUP_NEW/NEW_SETUP.kdbx $WANTPW --no-password -y 1:1097617 -a password'
  #export GETPW='tailscale ssh abrax@100.95.199.84 /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe keepassxc-cli show -k /home/mnt/nc/sec/WSL-Passwords.keyx /home/mnt/nc/WINDOWS/amdam/ResilioSync/resilio_encrypted/kee/WSL-Passwords.kdbx $WANTPW --no-password -y 2:1097617 -a password'
#fi
  ## getkey RCLONE_CONFIG_PASS
#WANT=RCLONE_CONFIG_PASS
#export $WANT=$(getkey)
  ## getkey OPENAI_API_KEY
#WANT=OPENAI_API_KEY
#export $WANT=$(getkey)
#WANT=RESTIC_PASSWORD
#export $WANT=$(getkey)
#export BH_URL=http://100.98.141.82:8081
export BH_URL=localhost:8082
#export HC_API_URL=https://hc.yyps.de/ping
export HC_PING_KEY=cbd0d1be-599b-4f6b-821a-b22401039018 ##bws
export HC_API_URL=http://192.168.11.3:8456/ping
#export OPENAI_API_KEY="$(eval $GET_OPENAI_API_KEY)"
#export RESTIC_PASSWORD="$(eval $GET_RESTIC_PASSWORD)"
#export START_XLAUNCH='eval $(/home/abrax/bin/kee.sh START_XLAUNCH)'
#echo RCLONE_CONFIG_PASS $RCLONE_CONFIG_PASS
#read me
#export RCLONE_CONFIG_PASS="$(cat ~/.ssh/RCPW)"
export GET_RCLONE="export RCLONE_PASSWORD_COMMAND='akeyless get-secret-value --name RCLONE_CONFIG_PASS'"
export GET_OPENAI="export OPENAI_API_KEY='akeyless get-secret-value --name OPENAI_API_KEY'"
#echo $MYKEY | keepassxc-cli show "/home/rslsync/Resilio Sync/resilio_encrypted/kee/MyBase231123_3.kdbx" -k "/home/rslsync/Resilio Sync/resilio_encrypted/kee/MyKey231123_3.keyx" $WANT -y 2:1097617 -a password
##export GET_RCLONE_PASSWORD_COMMAND='/home/abrax/bin/kee.sh RCLONE_PASSWORD_COMMAND'
#export RCLONE_PASSWORD_COMMAND="$(eval $GET_RCLONE_PASSWORD_COMMAND)"
#export GET_OPENAI_API_KEY='eval $(/home/abrax/bin/kee.sh OPENAI_API_KEY)'
#export GET_OPENAI_API_KEY='/home/abrax/bin/kee.sh OPENAI_API_KEY'
#fi
 # Define a widget that outputs '#1554'                                                                                                                       
paste-1554-widget() {                                                                                                                                        
   BUFFER='#1554'                                                                                                                                             
   zle accept-line                                                                                                                                            
 }                                                                                                                                                            
                                                                                                                                                              
 # Create the widget                                                                                                                                          
zle -N paste-1554-widget                                                                                                                                     

 # Bind the key combination to the widget (replace 'your-escape-sequence' with the actual one)                                                                
bindkey 'your-escape-sequence' paste-1554-widget  
export fritz="/run/user/1000/gvfs/smb-share:server=tower2.local,share=fritz.box_fritz.nas"
#open 'https://notica.us/?BYvT3P'
notica() { curl -s --data "d:$*" "https://notica.us/?BYvT3P" ; }
#y=1
#while [[ $y = 1 ]]; do
#notica "$(hostname) .env.zsh" >$HOME/tmp/del 2>&1
#if [[ $(cat $HOME/tmp/del) = *"No devices have that Notica ID open"* ]]; then
#  open 'https://notica.us/?BYvT3P'
#  y=1
#  sleep 2
#else
#  y=0
#fi
#done
export OPENAI_API_KEY=0

#echo $HISHTORY_SERVER
#echo $FLYCTL_INSTALL
#echo $PATH
#echo $BH_URL
#echo $HC_PING_KEY
#echo $HC_API_URL
#echo $GET_RCLONE
#echo $GET_OPENAI
#echo $fritz
eval "$(zoxide init zsh)"
notify_uno() { 
  curl https://notify.uno/66d39a613264f91f0f9c72c7 -d "$*"; 
}
#clear

if [ -n "$TMUX" ]; then
    source ~/.p10knull.zsh
    clear
    /home/abrax/bin/inside_tmux.sh
else
    echo -e "${BLUE}┌──────────────────────────────────────${NC}"
    echo -e "${BLUE}│  Terminal Status${NC}"
    echo -e "${BLUE}└─➤${NC} ${GRAY}Not inside tmux${NC}"
fi

if [[ $EMULATOR = "yakuake" ]] || [[ $EMULATOR = guake ]]; then 
     /home/abrax/bin/v6.sh
#  if [[ $(go-chromecast -a 192.168.11.55 status) = *"PLAYING"* ]]; then
#     /home/abrax/bin/v6.sh
#  else
#    /home/abrax/bin/ooo.sh
#  fi
fi

chmod +x ~/bin/*.sh
chmod +x ~/bin/db
export BWS_ACCESS_TOKEN=$(cat ~/.ssh/bws.dat)
XAUTHORITY=$HOME/.Xauthority

echo
