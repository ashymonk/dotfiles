# ~/.bash_profile: executed by bash(1) for non-login shells.

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi

	# include .bashrc_local if it exists
	if [ -f "$HOME/.bashrc_local" ]; then
		. "$HOME/.bashrc_local"
	fi
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
	export PATH="$HOME/bin:$PATH"
fi

# Set MANPATH so it includes users' private man if it exists
if [ -d "${HOME}/man" ]; then
	export MANPATH="${HOME}/man:${MANPATH}"
fi

# Set INFOPATH so it includes users' private info if it exists
if [ -d "${HOME}/info" ]; then
	export INFOPATH="${HOME}/info:${INFOPATH}"
fi

