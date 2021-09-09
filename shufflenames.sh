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
    fs=$(printf "%s\n" "$workdir"/$pattern)
    IFS=$'\n' fs=($fs)
    fslen=${#fs[@]}
    ind=1
    while [ $ind -lt $fslen ]; do
        ran=$(($RANDOM%($ind+1)))
        echo swapnames "${fs[$ran]}" "${fs[$ind]}"
        swapnames "${fs[$ran]}" "${fs[$ind]}"
        code=$?
        if [ ! $code -eq 0 ]; then return $code; fi
        ind=$(($ind+1))
    done
}

shufflenames $1 $2
