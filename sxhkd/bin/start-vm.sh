#!/bin/bash

LIBVIRT_URI="qemu:///system"
vm=$(virsh -c $LIBVIRT_URI list --all --name | rofi -dmenu -theme ~/.config/rofi/themes/gruvbox-dark.rasi -p " ")

if [ -z $vm ]; then
    exit
fi

virt-manager -c $LIBVIRT_URI --show-domain-console "$vm"
