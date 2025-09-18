quote() {
    if [[ -z $1 ]]; then
        printf "%s" "''"
    elif [[ $1 =~ [^+,\-./:=@_^[:alnum:]] ]]; then
        printf "%s" "'"
        printf "%s" "$1" | sed -E 's/(['"'"'!])/'"'"'\\\1'"'"'/g'
        printf "%s" "'"
    else
        printf "%s" "$1"
    fi
}
