#!/bin/bash

LIBVIRT_URI="qemu:///system"
VMS_RUNNING=$(virsh -c $LIBVIRT_URI list | grep running | wc -l)

if [[ "$VMS_RUNNING" -ne "0" ]]; then
    echo "  ${VMS_RUNNING}"
fi
