# ~/.bashrc: executed by bash(1) for non-login shells.

echo "Loading ~/.bashrc..." >&2

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    linux|xterm*|rxvt*|screen*|*-color)
        __color_prompt=yes
        ;;
esac

echo "Loading bashrc.d files..." >&2

for rcfile in $XDG_CONFIG_HOME/bash/rc.d/*.bash; do
    [ -f "$rcfile" ] && source "$rcfile"
done

echo " _               _     "
echo "| |__   __ _ ___| |__  "
echo "| '_ \ / _\` / __| '_ \ "
echo "| |_) | (_| \__ \ | | |"
echo "|_.__/ \__,_|___/_| |_|"
echo "                       "
echo Now: $(date '+%Y/%m/%d %a %H:%M:%S')
