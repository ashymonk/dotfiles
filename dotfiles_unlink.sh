#! /bin/sh
set -u

dotfile_restore()
{
	target=${HOME}/$1
	[ -f ${target} ] && return 0
	[ -f ${target}.old ] && mv ${target}.old ${target}
}

dotfile_dellink()
{
	target=${HOME}/$1
	[ -L ${target} ] && rm ${target}
}

dotfile_dellink .bash_profile
dotfile_dellink .bashrc
dotfile_dellink .vimrc
dotfile_dellink .gitconfig

dotfile_restore .bash_profile
dotfile_restore .bashrc
dotfile_restore .vimrc
dotfile_restore .gitconfig

exit 0
