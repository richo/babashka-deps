# vim: sw=2 ts=2
dev_environment() {
  requires "tmux_installed"
  requires "git_installed"
}

tmux_installed() {
  install_package tmux

  process
}

urxvt_installed() {
  install_package urxvt -a rxvt-unicode-256color

  process
}

git_installed() {
  # TODO Old debian versions called this git-core
  install_package git

  process
}

irssi_installed() {
  install_package irssi

  process
}
