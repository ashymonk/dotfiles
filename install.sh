#! /bin/sh
set -u
cd $(dirname $0)

TARGET_DIR=$HOME

mkdir -p $TARGET_DIR/.config
mkdir -p $TARGET_DIR/.cache
mkdir -p $TARGET_DIR/.local/share

for package in $(ls -d */)
do
	stow -R --no-folding -t $TARGET_DIR $package
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
