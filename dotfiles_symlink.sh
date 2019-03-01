#! /bin/sh
set -eu

filebackup()
{
	target=${HOME}/$1
	[ -f ${target}.old ] && return 0
	[ -f ${target} ] && mv ${target} ${target}.old
}

DOTFILES_DIR=$(cd $(dirname $0); pwd)

filebackup .bash_profile
filebackup .bashrc
filebackup .vimrc

ln -sf ${DOTFILES_DIR}/.bash_profile ~/.bash_profile
ln -sf ${DOTFILES_DIR}/.bashrc ~/.bashrc
ln -sf ${DOTFILES_DIR}/.vimrc ~/.vimrc
