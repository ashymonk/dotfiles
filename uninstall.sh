#! /bin/sh
set -u

TARGET_DIR=$HOME

cd $(dirname $0)

for package in $(ls -d */)
do
	stow -t $TARGET_DIR -D $package
done

