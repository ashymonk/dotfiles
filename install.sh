#! /bin/sh
set -u

TARGET_DIR=$HOME

cd $(dirname $0)

. sh/.profile

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME

for package in $(ls -d */)
do
	stow -t $TARGET_DIR -R $package

	if [ $? -ne 0 ]; then
		echo "stowing $package failed."
		exit 1
	fi
done

echo "************************************"
echo "* dotfiles installation succeeded. *"
echo "************************************"

bash --login

exit 0
