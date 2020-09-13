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
	*) LANG=en_US.UTF-8 ;;
esac
export LANG

# PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$CARGO_HOME/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
export INFOPATH="$HOME/.local/share/info:$INFOPATH"

# Editor
export EDITOR=vim

# XDG base directory HOME
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"


##
## CUI application environment
##

# vim
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export RUST_SRC_PATH="$(rustc --print sysroot 2>/dev/null)/lib/rustlib/src/rust/src"

# ctags
export CTAGS="--options=$XDG_CONFIG_HOME/ctags/ctags.conf"

# gtags
export GTAGSCONF="$XDG_CONFIG_HOME/gtags/gtags.conf"

# bashmarks
export SDIRS="$XDG_DATA_HOME/bash/sdirs"


##
## X11 application environment
##

# IM
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# i3
export TERMINAL="run_urxvtc"

# rxvt-unicode
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd"
export URXVT_PERL_LIB="$XDG_CONFIG_HOME/urxvt/ext"


# include user local profile
[ -f ~/.profile.local ] && . ~/.profile.local

