#!/bin/bash
count=${#1}
echo $count
if (($count < 2)); then
  printf "${BLUE}"
  echo "---> Which file?"
  echo "=================="
  printf "${GREEN}"
  echo
  echo "1) start_app.sh"
  echo "2) start_app2.sh"
  echo "3) start_app3.sh"
  echo "4) start_app_movies.sh"
  echo "5) backup_all.sh"
  echo
  echo "6) .zshrc"
  echo "7) .bashrc"
  echo "8) .p10"
  echo "9) alias.dat"
  echo "10) docker-compose.yml"
  read -n 1 choice1
  read -n 1 -t 1 choice2
  choice=$(echo $choice1$choice2)
  echo; echo choice1 $choice1; echo
  echo; echo choice2 $choice2; echo
  echo; echo choice $choice; echo
  sleep 3
  if (($choice == 1)); then
    app=start_app.sh
  elif (($choice == 2)); then
    app=start_app2.sh
  elif (($choice == 3)); then
    app=start_app3.sh
  elif (($choice == 5)); then
    app=backup_all.sh
  elif (($choice == 4)); then
    app=start_app_movies.sh
  elif (($choice == 6)); then
    app="nano ~/.zshrc"
  elif (($choice == 7)); then
    app="nano ~/.bashrc"
  elif (($choice == 8)); then
    app="nano ~/.p10k.zsh"
  elif (($choice == 9)); then
    app="nano ~/bin/alias.dat"
  elif (($choice == 10)); then
    app="nano /volume1/docker/main/docker-compose.yml"
  fi
else
  app=$1
fi
echo App: $app
$app

