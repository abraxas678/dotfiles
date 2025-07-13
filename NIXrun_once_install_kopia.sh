#! /bin/bash
command -v kopia >/dev/null 2>&1
if [[ $? != 0 ]]; then
mkdir $HOME/tmp
cd $HOME/tmp
curl -s https://kopia.io/signing-key | sudo gpg --dearmor -o /etc/apt/keyrings/kopia-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kopia-keyring.gpg] http://packages.kopia.io/apt/ stable main" | sudo tee /etc/apt/sources.list.d/kopia.list
sudo apt update
sudo apt install kopia -y
sudo apt install kopia-ui -y

fi
