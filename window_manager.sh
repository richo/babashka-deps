lightweight_x11_environment() {
    requires "x11_server_installed"
    requires "ratpoison_installed"
    requires "urxvt_installed"
}

x11_server_installed() {
    install_package x11-server -a xserver-xorg
    process
}

ratpoison_installed() {
    install_package ratpoison
    process
}
