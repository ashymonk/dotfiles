# ~/.bash_profile: executed by bash(1) for non-login shells.

# if running bash
if [ -n "$BASH_VERSION" ]; then

	# include bashrc
	[[ -f ~/.bashrc ]] && source ~/.bashrc
fi

# include user profile
[[ -f ~/.profile ]] && source ~/.profile

