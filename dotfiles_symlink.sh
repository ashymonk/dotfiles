#! /bin/sh
set -eu

DOTFILES_DIR=$(cd $(dirname $0); pwd)

dotfile_backup()
{
	target=${HOME}/$1
	[ -f ${target}.old ] && return 0
	[ -f ${target} ] && mv ${target} ${target}.old
}

dotfile_link()
{
	srcfile=${DOTFILES_DIR}/$1
	destfile=${HOME}/$1
	ln -sf ${srcfile} ${destfile}
}

dotfile_backup .bash_profile
dotfile_backup .bashrc
dotfile_backup .vimrc

dotfile_link .bash_profile
dotfile_link .bashrc
dotfile_link .vimrc

exit 0
