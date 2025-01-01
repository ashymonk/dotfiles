# ~/.xinitrc

echo "Loading ~/.xinitrc..."

xrdb -DHOME_DIR=$HOME -merge ~/.Xresources
export XDG_CURRENT_DESKTOP=i3
exec i3
