#! /bin/bash
if [[ $(hostname) = *"nuc"* ]]; then
[[ $(whoami) = "root" ]] && MYSUDO="" || MYSUDO="sudo"
which thorium-browser >/dev/null 2>&1
if [[ $? != 0 ]]; then
    mkdir -p $HOME/tmp
    cd $HOME/tmp
    echo "install thorium browser"
    $HOME/tmp/public/github_latest_release_url.sh Alex313031 thorium >url
    URL=$(cat url | tail -n1)
    echo; echo "URL $URL"; echo
    echo; echo "wget $URL"; echo
    wget $URL
#    $MYSUDO apt install -y $HOME/tmp/$(basename $URL)
    sudo apt install -y $HOME/tmp/$(basename $URL)
    [[ $? = 0 ]] && sudo apt purge -y firefox
    rm $(basename $URL)
fi
rm url -f
fi
