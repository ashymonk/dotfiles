#! /bin/sh
set -u
cd $(dirname $0)

. ./env.sh

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_DATA_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $TARGET_HOME/bin
mkdir -p $TARGET_HOME/.local/bin

for package in $(ls -d */ | cut -d'/' -f1)
do
	[ -f $package/hook-pre-install ] && (\cd $package && sh hook-pre-install)

	stow --restow --ignore hook-pre-install --ignore hook-post-install --target $TARGET_HOME $package
	if [ $? -ne 0 ]; then
		echo "stowing $package failed."
		exit 1
	fi

	[ -f $package/hook-post-install ] && (\cd $package && sh hook-post-install)
done

echo "**********************"
echo "* installed dotfiles *"
echo "**********************"

bash -li

exit 0
