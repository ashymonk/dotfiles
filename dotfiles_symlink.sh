#! /bin/sh
set -eu

DOTFILES_DIR=$(cd $(dirname $0); pwd)

ln -sf ${DOTFILES_DIR}/.vimrc ~/.vimrc
ln -sf ${DOTFILES_DIR}/.bash_profile ~/.bash_profile
