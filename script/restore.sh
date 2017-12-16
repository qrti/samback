#!/bin/bash

# restore V0.5 171214 qrt@qland.de
# linux bash script to restore samsung tv recordings
#
# necessary install: pipe viewer
# sudo apt-get install pv

# usage:
# sudo ./restore.sh filename

SRC="~/Downloads/"                                                  # source path to backup drawer
DST="/media/USER/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/CONTENTS/"    # destination path to harddisk drawer with samsung tv recordings

if [ "$EUID" -ne 0 ]; then
    printf "\n"
    printf "please run as root\n"
    printf "\n"
    exit 1
fi

pv $SRC$1.tar | tar --same-owner -xpf - -C $DST

echo
echo ready
echo
