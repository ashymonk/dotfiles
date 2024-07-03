#! /bin/sh
set -u
cd $(dirname $0)

. ./environment

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_DATA_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $TARGET_HOME/bin
mkdir -p $TARGET_HOME/.local/bin

for package in $(ls -d */ | cut -d'/' -f1)
do
	[ -f $package/PKG/pre-install ] && (\cd $package && sh PKG/pre-install)

	stow --restow --ignore PKG --target $TARGET_HOME $package
	if [ $? -ne 0 ]; then
		echo "stowing $package failed."
		exit 1
	fi

	[ -f $package/PKG/post-install ] && (\cd $package && sh PKG/post-install)
done

echo "  ___           _        _ _          _ _ "
echo " |_ _|_ __  ___| |_ __ _| | | ___  __| | |"
echo "  | || '_ \/ __| __/ _\` | | |/ _ \/ _\` | |"
echo "  | || | | \__ \ || (_| | | |  __/ (_| |_|"
echo " |___|_| |_|___/\__\__,_|_|_|\___|\__,_(_)"
echo "                                          "

bash -li

exit 0
