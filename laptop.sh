laptop_utils() {
    requires "powertop_installed"
}

powertop_installed() {
    install_package powertop
    process
}
