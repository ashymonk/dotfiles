# ~/.bash_profile: executed by bash(1) for non-login shells.

echo "Sourcing ~/.bash_profile..." >&2

# include user profile
[[ -f ~/.profile ]] && source ~/.profile

# if running bash
if [ -n "$BASH_VERSION" ]; then

	# include bashrc
	[[ -f ~/.bashrc ]] && source ~/.bashrc
fi
