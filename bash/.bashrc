# ~/.bashrc: executed by bash(1) for non-login shells.

echo "Loading ~/.bashrc..." >&2

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load Bourne shell rc file
[ -e "$ENV" ] && source "$ENV"

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

# Print banner if shell is Bash
if [ ! -n "$BASH" ]; then
    return
fi

# Print banner
echo
echo "    Welcome to Bash!"
echo
fetch
