# vim: sw=2 ts=2
richo_generic() {
  requires "dev_environment"
  requires "irssi_installed"
}

dev_environment() {
  requires "tmux_installed"
  requires "git_installed"
}

elaborate_shell() {
  requires "zsh_installed"
  requires "tmux_installed"
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

zsh_installed() {
  install_package zsh

  process
}

build_essential() {
  install_package build-essential

  process
}

autotools() {
  install_package autoconf

  process
}

libtool() {
  install_package libtool

  process
}

libcurl_dev() {
  install_package libcurl4-gnutls-dev

  process

}
