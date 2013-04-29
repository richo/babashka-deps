wireless_tools_installed() {
    requires "wireless_tools_deb"
    requires "wpasupplicant_deb"
}

wireless_tools_deb() {
    install_package "wireless-tools"
    process
}

wpasupplicant_deb() {
    install_package "wpasupplicant"
    process
}
