#!/bin/bash

# backup V0.5 171214 qrt@qland.de
# linux bash script to backup samsung tv recordings
#
# necessary install: pipe viewer
# sudo apt-get install pv

# usage:
# sudo ./backup.sh

#    yyyyMMddhhmmss           backup mask 
REC="201711????????"        # (example: all recordings made in november 2017)

SRC="/media/USER/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/CONTENTS/"    # source path to harddisk drawer with samsung tv recordings
DST="~/Downloads/"                                                  # destination path to backup drawer

pause(){
    printf "\n"
    printf "$1\n"
    read -p "press [Enter] to continue, CTRL-C to abort" key
    printf "\n"
}

if [ "$EUID" -ne 0 ]; then
    printf "\n"
    printf "please run as root\n"
    printf "\n"
    exit 1
fi

files=($SRC$REC.srf)

if ! [ -f ${files[0]} ]; then
    printf "\n"
    printf "no matching recordings\n"
    printf "\n"
    exit 1
fi

pause "recordings to backup: ${#files[@]}"

n=${#files[@]}

for pafnex in ${files[@]}; do
    pafn=${pafnex%.*}
    fn=${pafn##*/}
    printf "%s (%d)\n" $fn $((n--))
    tar cpf - $SRC$fn.* -P | pv -s $(find $SRC -name "$fn.*" -exec du -b {} \; | awk 'BEGIN{total=0}{total=total+$1}END{print total}') > $DST$fn.tar
    printf "\n"
done

pause "recordings to delete: ${#files[@]}"

for pafnex in ${files[@]}; do
    pafn=${pafnex%.*}
    fn=${pafn##*/}
    printf "%s.*\n" $fn
    rm "$pafn".*
done

echo
echo ready
echo
