#! /bin/sh
set -u
cd $(dirname $0)

TARGET_DIR=$HOME

for package in $(ls -d */)
do
	stow -t $TARGET_DIR -D $package
	if [ $? -ne 0 ]; then
		echo "unstowing $package failed."
		exit 1
	fi
done

echo "**********************"
echo "* uninstalled dotfiles *"
echo "**********************"

bash -li

exit 0
