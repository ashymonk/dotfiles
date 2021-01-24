# sourced by ~/.bashrc

# enable color support of ls and also add handy aliases
if [ "$__color_prompt" = yes ]; then
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias diff='diff --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	alias ip='ip --color=auto'
	alias dmesg='dmesg --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ll='ls -alF'
alias la='ls -A'
alias cd='cdls'
alias tmux='tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf'
alias words='tr -cs "A-Za-z" "\n"'
alias findf='find -type f'
alias findd='find -type d'
alias findn='find -name'
alias findfn='find -type f -name'
alias finddn='find -type d -name'
alias rm-escseq-csi-sgr="sed -r 's/\x1b\[[0-9;]*m//g'"
alias rm-escseq-osc="sed -r 's/\x1b\].*(\x07|\x1b\\\\)//g'"
