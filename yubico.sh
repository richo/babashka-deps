yubico_pam() {
    requires "build_essential"
    requires "autotools"
    requires "libtool"
    requires "libpam_dev"

    requires "yubico_pam_installed"
}

libpam_dev() {
    install_package libpam0g-dev
    process
}

yubico_pam_checked_out() {
    mkdir -p "$HOME/code"

    git_checkout "git://github.com/Yubico/yubico-pam.git" \
        "$HOME/code/yubico-pam"

    process
}

yubico_c_client_checked_out() {
    mkdir -p "$HOME/code"

    git_checkout "git://github.com/Yubico/yubico-c-client.git" \
        "$HOME/code/yubico-c-client"

    process
}

yubico_c_checked_out() {
    mkdir -p "$HOME/code"

    git_checkout "git://github.com/Yubico/yubico-c.git" \
        "$HOME/code/yubico-pam"

    process
}

yubico_personalization_checked_out() {
    mkdir -p "$HOME/code"

    git_checkout "git://github.com/Yubico/yubico-personalization.git" \
        "$HOME/code/yubico-pam"

    process
}

libykclient_configured() {
    requires "libykclient_autoconfd"

    configured "$HOME/code/yubico-c-client"
}

libykclient_autoconfd() {
    requires "yubico_c_client_checked_out"
    autoreconfd "$HOME/code/yubico-c-client"

    process
}

libykclient_installed() {
    requires "libykclient_configured"

    function is_met() {
        false
    }
    function meet() {
        make
        $__babashka_sudo make install
    }
}

yubico_pam_autoconfd() {
    requires "yubico_pam_checked_out"

    autoreconfd "/home/richo/code/yubico-pam"

    process
}

yubico_pam_configured() {
    requires "yubico_pam_autoconfd"
    requires "libykclient_installed"

    configured "/home/richo/code/yubico-pam"

    process
}

yubico_pam_installed() {
    requires "yubico_pam_configured"
}
