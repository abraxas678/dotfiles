#!/bin/bash
#./github_latest_release_url.sh binwiederhier pcopy
instgit() {
  curl -sL "https://api.github.com/repos/$1/$2/releases/latest" | gron | grep browser_download_url | grep deb | sed "s/.*browser_download_url = //" | sed "s/^\"//" | sed "s/\";$//" | grep -v arm >res
  COUNT=$(cat res | wc -l)
  if [[ $COUNT != 0 ]]; then
    echo -n ""
  else
    curl -sL "https://api.github.com/repos/$1/$2/releases/latest" | gron | grep browser_download_url | sed "s/.*browser_download_url = //" | sed "s/^\"//" | sed "s/\";$//" | grep -v arm >res
    COUNT=$(cat res | wc -l)
   fi
   RES="$(cat res | sed 's/.*download//'| fzf)"
   if [[ $COUNT != 0 ]]; then
     cat res | grep "$RES" | xsel -b
     cat res | grep "$RES"
     $MYSUDO apt update
     wget $(cat res | grep "$RES")
     $MYSUDO apt install -y  ./$(basename $(cat res | grep "$RES"))
   else
     cat res
     echo no
   fi
}
if [[ ! -f /usr/bin/pcopy ]]; then
  instgit binwiederhier pcopy
  echo
  pcopy join --force https://p.xxxyzzz.xyz
  echo
fi

