# ~/.bash_profile: executed by bash(1) for non-login shells.

# include user profile
[[ -f ~/.profile ]] && source ~/.profile

# Application config
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME"/bash-completion/bash_completion

# if running bash
if [ -n "$BASH_VERSION" ]; then

	# include bashrc
	[[ -f ~/.bashrc ]] && source ~/.bashrc
fi

