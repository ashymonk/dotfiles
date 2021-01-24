# ~/.bashrc: executed by bash(1) for non-login shells.

echo "Sourcing ~/.bashrc..."

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    linux|xterm*|rxvt*|screen*|*-color)
        __color_prompt=yes
        ;;
esac

echo "Loading bashrc.d files..."

for rcfile in $XDG_CONFIG_HOME/bash/rc.d/*.bash; do
    [ -f "$rcfile" ] && source "$rcfile"
done
