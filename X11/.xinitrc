# ~/.xinitrc

echo "Loading ~/.xinitrc..."

xrdb -DHOME_DIR=$HOME -merge ~/.Xresources
exec i3
