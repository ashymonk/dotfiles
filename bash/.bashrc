# ~/.bashrc: executed by bash(1) for non-login shells.

echo "Loading ~/.bashrc..." >&2

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load Bourne shell rc file
[ -n "$ENV" ] && [ -e "$ENV" ] && source "$ENV"

# Set a fancy prompt flag
case "$TERM" in
    linux|xterm*|rxvt*|screen*|*-color)
        __color_prompt=yes
        ;;
esac

echo "Loading bashrc.d files..." >&2
bash_rc_dir=${XDG_CONFIG_HOME:-$HOME/.config}/bash/rc.d
if [ -d "$bash_rc_dir" ]; then
    for rcfile in "$bash_rc_dir"/*.bash; do
        [ -f "$rcfile" ] && source "$rcfile"
    done
fi
unset bash_rc_dir

# Print banner
echo
echo "    Welcome to Bash!"
echo
command -v fetch >/dev/null 2>&1 && fetch
