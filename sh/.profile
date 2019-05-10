# ~/.profile

# Language
case $TERM in
	linux) LANG=C ;;
	*) LANG=ja_JP.UTF-8 ;;
esac
export LANG

# Editor
export EDITOR='vim -c "set fenc=utf-8"'

# XDG base directory HOME.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Application config.
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# PATH / MANPATH / INFOPATH
[ -d "$HOME/bin" ]               && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ]        && export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.local/share/man" ]  && export MANPATH="$HOME/.local/share/man:$MANPATH"
[ -d "$HOME/.local/share/info" ] && export INFOPATH="$HOME/.local/share/info:$INFOPATH"

# include user local profile
[ -f ~/.profile.local ] && . ~/.profile.local

