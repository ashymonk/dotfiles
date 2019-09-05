#! /bin/sh
set -u
cd $(dirname $0)

. ./config

mkdir -p $TARGET_HOME/.config
mkdir -p $TARGET_HOME/.cache
mkdir -p $TARGET_HOME/.local/share

for package in $(ls -d */)
do
	stow -R --no-folding -t $TARGET_HOME $package
	if [ $? -ne 0 ]; then
		echo "stowing $package failed."
		exit 1
	fi
done

echo "**********************"
echo "* installed dotfiles *"
echo "**********************"

bash -li

exit 0
