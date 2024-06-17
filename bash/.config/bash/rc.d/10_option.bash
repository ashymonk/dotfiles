# sourced by ~/.bashrc

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
[[ $DISPLAY ]] && shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# disable tty stop
stty stop undef

# expand dir variable
shopt -s direxpand

# cd dir path when execute dir path.
shopt -s autocd

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# print exit status if error
function error_status() {
    status=$?
    [ $status -ne 0 ] && echo "($status)"
}

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "$__color_prompt" = yes ]; then
    PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w`__git_ps1 " (%s)"`\n\[\033[00m\]$(error_status)\$ '
else
    PS1='\n${debian_chroot:+($debian_chroot)}\u@\h: \w`__git_ps1 " (%s)"`\n$(error_status)\$ '
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
    #export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
fi
