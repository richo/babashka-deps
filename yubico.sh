yubico_pam() {
    requires "build_essential"
    requires "autotools"
    requires "libpam_dev"

    requires "yubico_pam_checked_out"
}

libpam_dev() {
    install_package libpam0g-dev
    process
}

yubico_pam_checked_out() {
    function is_met() {
        [ -d ~/code/yubico-pam ]
    }

    function meet() {
        mkdir -p "~/code"
        git clone git://github.com/Yubico/yubico-pam.git \
            ~/code/yubico-pam
    }

    process
}
