#!/bin/sh
function swapnames() {
    if [ ! "$2" == "$1" ]; then
        tf=$(mktemp "$1.XXXXXX") && mv "$1" "$tf" && mv "$2" "$1" &&  mv "$tf" "$2" 
    fi
}

function shufflenames() {
    workdir=$1
    pattern=$2
    if [ "$workdir" == "" ]; then workdir="."; fi
    if [ "$pattern" == "" ]; then pattern="*"; fi
    fs=$(printf "%s," "$workdir"/$pattern)
    ind=1
    echo files: $fs
    while :; do
        f1=`echo $fs | cut -d,  -f$ind`
        # echo $ind $f1
        if [ "$f1" == "" ]; then break; fi
        ran=$(($RANDOM%$ind+1))
        f2=`echo $fs | cut -d,  -f$ran`
        echo swapnames "$f1" "$f2"
        swapnames "$f1" "$f2"
        code=$?
        if [ ! $code -eq 0 ]; then return $code; fi
        ind=$(($ind+1))
    done
}

shufflenames $1 $2