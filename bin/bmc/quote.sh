quote() {
    if [[ -z $1 ]]; then
        echo -n "''"
    elif [[ $1 =~ [^+,\-./:=@_^[:alnum:]] ]]; then
        echo -n "'"
        echo -n "$1" | sed -E 's/(['"'"'!])/'"'"'\\\1'"'"'/g'
        echo -n "'"
    else
        echo -n "$1"
    fi
}
