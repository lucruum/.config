fatal() {
    for it; do
        echo -e "$it" >&2
    done
    exit 1
}
