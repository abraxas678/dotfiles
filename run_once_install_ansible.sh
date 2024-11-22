#!/bin/bash
echo
###
echo
###
echo
###
echo
###
echo
###
echo
###
echo
###
###
###

install_on_fedora() {
    sudo dnf install -y ansible
}

install_on_ubuntu() {
    sudo apt-get update
    sudo apt-get install -y ansible
}

install_on_mac() {
    brew install ansible
}

OS="$(uname -s)"
case "${OS}" in
    Linux*)
        if [ -f /etc/fedora-release ]; then
            install_on_fedora
        elif [ -f /etc/lsb-release ]; then
            install_on_ubuntu
        else
            echo "Unsupported Linux distribution"
            exit 1
        fi
        ;;
    Darwin*)
        install_on_mac
        ;;
    *)
        echo "Unsupported operating system: ${OS}"
        exit 1
        ;;
esac


#ansible-playbook ~/bin/setup_ansible_apps_$(hostname).yml --ask-become-pass -i /home/abrax/.config/ansible/inventory.ini
ansible-playbook ~/bin/setup_ansible_apps.yml --ask-become-pass -i /home/abrax/.config/ansible/inventory.ini

echo "Ansible installation complete."
