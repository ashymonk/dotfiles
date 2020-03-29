# ~/.profile

# umask
if [ "`id -ur`" -gt 199 ] && [ "`id -gn`" = "`id -un`" ]; then
	umask 002
else
	umask 022
fi

# Language
case $TERM in
	linux) LANG=C ;;
	*) LANG=ja_JP.UTF-8 ;;
esac
export LANG

# Editor
export EDITOR=vim

# XDG base directory HOME.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Application config.
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export RUST_SRC_PATH="$(rustc --print sysroot 2>/dev/null)/lib/rustlib/src/rust/src"
export CTAGS="--options=$XDG_CONFIG_HOME/ctags/ctags.conf"
export GTAGSCONF="$XDG_CONFIG_HOME/gtags/gtags.conf"
export SDIRS="$XDG_DATA_HOME/bash/sdirs"

# PATH / MANPATH / INFOPATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$CARGO_HOME/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
export INFOPATH="$HOME/.local/share/info:$INFOPATH"

# include user local profile
[ -f ~/.profile.local ] && . ~/.profile.local

