# ~/.bash_profile: executed by bash(1) for login shells.

echo "Loading ~/.bash_profile..." >&2

# include user profile
[[ -f "$HOME/.profile" ]] && source "$HOME/.profile"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include bashrc
    [[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
fi
