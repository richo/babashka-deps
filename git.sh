function git_checkout() {
    from=$1
    to=$2
    function is_met() {
        [ -d "$to/.git" ]
    }
    function meet() {
        git clone "$from" "$to"
    }
}
