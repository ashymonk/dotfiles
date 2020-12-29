# ~/.bashrc: executed by bash(1) for non-login shells.

echo "Sourcing ~/.bashrc..."

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

alias cd='cdls'
alias tmux='tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf'
alias words='tr -cs "A-Za-z" "\n"'

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Function definitions.

# ls after cd
cdls ()
{
	builtin cd "$@" && ls
}

# parent directory
# Usage .. [n]
.. ()
{
	local arg=${1:-1}
	local dir=""

	while [ $arg -gt 0 ];
	do
		dir="../$dir"
		arg=$((arg - 1));
	done

	cd $dir >/dev/null 2>&1
}

# plugin
[[ -f ~/.local/bin/bashmarks.sh ]] && source ~/.local/bin/bashmarks.sh
[[ -f ~/.local/bin/autojump.bash ]] && source ~/.local/bin/autojump.bash
[[ -f ~/.local/bin/git-prompt.sh ]] && source ~/.local/bin/git-prompt.sh

for rcfile in $XDG_CONFIG_HOME/bash/bashrc.d/*.bash; do
    [ -f "$rcfile" ] && source "$rcfile"
done
