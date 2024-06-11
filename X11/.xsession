# ~/.xsession

echo "Loading ~/.xsession..."

. ~/.profile
xrdb -DHOME_DIR=$HOME -merge ~/.Xresources
