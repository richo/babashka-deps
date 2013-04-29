# vim: sw=2 ts=2
dev_environment() {
  requires "tmux_installed"
  requires "urxvt_installed"
}

tmux_installed() {
  install_package tmux

  process
}

urxvt_installed() {
  install_package urxvt -a rxvt-unicode-256color

  process
}
