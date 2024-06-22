# sourced by ~/.bashrc

# print exit status if error
function exit_status() {
    status=$?
    if [ $status -ne 0 ]; then
        printf "[%3d]" $status
    else
        echo "[---]"
    fi
}

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "$__color_prompt" = yes ]; then
    PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w`__git_ps1 " (%s)"`\n\[\033[00m\]$(exit_status) \$ '
else
    PS1='\n${debian_chroot:+($debian_chroot)}\u@\h: \w`__git_ps1 " (%s)"`\n$(exit_status) \$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
esac

if [ "$__color_prompt" = yes ]; then
    [ -x /usr/bin/dircolors ] && test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # colored GCC warnings and errors
    export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
fi
