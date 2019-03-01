#! /bin/sh
set -eu

DOTFILES_DIR=$(cd $(dirname $0); pwd)

filebackup()
{
	target=${HOME}/$1
	[ -f ${target}.old ] && return 0
	[ -f ${target} ] && mv ${target} ${target}.old
}

filelink()
{
	srcfile=${DOTFILES_DIR}/$1
	destfile=${HOME}/$1
	ln -sf ${srcfile} ${destfile}
}

filebackup .bash_profile
filebackup .bashrc
filebackup .vimrc

filelink .bash_profile
filelink .bashrc
filelink .vimrc

