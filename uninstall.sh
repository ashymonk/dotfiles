#! /bin/sh
set -u
cd $(dirname $0)

. ./environment

# Uninstall package
for package in $(ls -d */ | cut -d'/' -f1)
do
	stow --delete --target $TARGET_HOME $package
	if [ $? -ne 0 ]; then
		echo "unstowing $package failed."
		exit 1
	fi
done

echo "************************"
echo "* uninstalled dotfiles *"
echo "************************"

exec $SHELL -li
