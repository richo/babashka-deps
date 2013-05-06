function autoreconfd() {
    to="$1"

    function is_met() {
        [ -f "$to/configure" ]
    }
    function meet() {
        (
            cd "$to"
            autoreconf -i
        )
    }
}

function configured() {
    to="$1"

    function is_met() {
        [ -f "$to/config.cache" ]
    }
    function meet() {
        (
            cd "$to"
            ./configure
        )
    }
}

