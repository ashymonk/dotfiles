#! /bin/sh
set -u
cd $(dirname $0)

. ./environment

# Make directories
mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_DATA_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $TARGET_HOME/src
mkdir -p $TARGET_HOME/tmp
mkdir -p $TARGET_HOME/bin
mkdir -p $TARGET_HOME/.local/bin

# Show package using commands
notfound=false
foldwidth=$(($(tput cols) - 4))
for package in $(ls -d */ | cut -d'/' -f1)
do
    notfound_commands="$(./check-commands "$package")"
    [ -z "$notfound_commands" ] && continue
    notfound=true
    echo "The following commands '$package' uses are not installed:" &&
        echo "$notfound_commands" | tr '\n' ' ' | fold -s -w$foldwidth | sed 's/^/    /'
    echo
done

# Show prompt to confirm
if [ "$notfound" = true ]; then
    while true; do
        printf 'Do you want to proceed with installation? [Y/n] '
        read answer
        case $answer in
            "" ) break;;
            [Yy][Ee][Ss] ) break;;
            [Yy] ) break;;
            [Nn][Oo] ) exit;;
            [Nn] ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

# Install package
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

exec $SHELL -li
