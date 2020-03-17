#!/bin/bash

prog=$0
dev_str="/dev/sd"

display_usage(){

    echo "usage : $prog [-d] [dev]"
    echo "-d        device to write to (${dev_str}X)"
    echo "-h        help"
    exit 1
}

if [ $# -lt 1 ]
then 
    display_usage
    exit 1
fi

if [ $# -eq 1 ]
then

    if [[ $1 == "-h"  || $1 == "-d" ]] 
    then 
        display_usage
        exit 1
    else
        echo "Wrong arguments. Try $prog -h for help"
        exit 1
    fi
fi

if [[ $1 == "-d" && $2 == *$dev_str* ]]
then
    sdcard=$2
    
    echo "wiping data"
    #sudo dd if=/dev/zero of=$sdcard bs=400 status=progress
    sudo umount "${sdcard}1"
    sudo umount "${sdcard}2"
    
    sudo parted $sdcard rm 1
    sudo parted $sdcard rm 2
    
    sudo parted $sdcard mkpart primary ext4 0 100%
    
    echo "Witing sdcard.img to $sdcard"
    sudo dd if=buildroot/output/images/sdcard.img of=$sdcard status=progress

    echo "Done copying!!"
    
    echo "Ejecting sdcard $sdcard"
    
    sudo eject $sdcard
    echo "Done!!"
    
    exit 0
else
    echo "Wrong arguments. Try $prog -h for help"
    exit 1
fi
