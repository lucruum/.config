getopt() {
    local stderr=$(command getopt "$@" 2>&1 > /dev/null)
    echo "$stderr" |
    while IFS= read -r; do
        [[ $REPLY =~ ^getopt:\ option\ \'(.*)\'\ is\ ambiguous ]] && echo "Option is ambiguous: $(quote "${BASH_REMATCH[1]}")" >&2
        [[ $REPLY =~ ^getopt:\ unrecognized\ option\ \'(.*)\'$ ]] && echo "Invalid option: $(quote "${BASH_REMATCH[1]}")" >&2
        [[ $REPLY =~ ^getopt:\ option\ \'(.*)\'\ doesn\'t\ allow\ an\ argument$ ]] && echo "Option does not allow an argument: $(quote "${BASH_REMATCH[1]}")" >&2
        [[ $REPLY =~ ^getopt:\ option\ \'(.*)\'\ requires\ an\ argument$ ]] && echo "Option requires an argument: $(quote "${BASH_REMATCH[1]}")" >&2
        [[ $REPLY =~ ^getopt:\ invalid\ option\ --\ \'(.)\'$ ]] && echo "Invalid option: -${BASH_REMATCH[1]}" >&2
    done
    [[ -n $stderr ]] && return 1
    command getopt "$@"
}
