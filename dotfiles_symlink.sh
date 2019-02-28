#! /bin/sh
set -eu

DOTFILES_DIR=$(cd $(dirname $0); pwd)

[ ! -f ~/.bash_profile.old ] && [ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.bash_profile.old
[ ! -f ~/.bashrc.old ] && [ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.old
[ ! -f ~/.vimrc.old ] && [ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.old

ln -sf ${DOTFILES_DIR}/.bash_profile ~/.bash_profile
ln -sf ${DOTFILES_DIR}/.bashrc ~/.bashrc
ln -sf ${DOTFILES_DIR}/.vimrc ~/.vimrc
