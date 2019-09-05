#! /bin/sh
set -u
cd $(dirname $0)

. ./config

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_DATA_HOME
mkdir -p $XDG_CACHE_HOME

for package in $(ls -d */ | cut -d'/' -f1)
do
	[ -f $package/hook-pre-install ] && . $package/hook-pre-install

	stow -R --no-folding --ignore hook-pre-install --ignore hook-post-install -t $TARGET_HOME $package
	if [ $? -ne 0 ]; then
		echo "stowing $package failed."
		exit 1
	fi

	[ -f $package/hook-post-install ] && . $package/hook-post-install
done

echo "**********************"
echo "* installed dotfiles *"
echo "**********************"

bash -li

exit 0
