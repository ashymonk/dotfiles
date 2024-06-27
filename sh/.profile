# ~/.profile

echo "Loading ~/.profile..."

# Functions
export_lang() {
    if locale -a | grep -q "^$1$"; then
        export LANG=$1
        return 0
    else
        return 1
    fi
}
add_path() {
    case ":$PATH:" in
      *":$1:"*) :;; # already there
      *) export PATH="$1:$PATH";; # add path
    esac
}
add_manpath() {
    case ":$MANPATH:" in
      *":$1:"*) :;; # already there
      *) export MANPATH="$1:$MANPATH";; # add path
    esac
}
add_infopath() {
    case ":$INFOPATH:" in
      *":$1:"*) :;; # already there
      *) export INFOPATH="$1:$INFOPATH";; # add path
    esac
}

# umask
if [ "`id -ur`" -gt 199 ] && [ "`id -gn`" = "`id -un`" ]; then
        umask 002
else
        umask 022
fi

# Language
if [ "$TERM" = "linux" ]; then
    export_lang "C.utf8" ||
        export_lang "C"
else
    export_lang "ja_JP.utf8" ||
        export_lang "en_US.utf8" ||
        export_lang "C.utf8" ||
        export_lang "C"
fi

# XDG base directory HOME
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# editor
export EDITOR=vim

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
export GTAGSLABEL=pygments

# bashmarks
export SDIRS="$XDG_DATA_HOME/bash/sdirs"

# readline
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# Path
add_path "$HOME/bin"
add_path "$HOME/.local/bin"
add_path "$CARGO_HOME/bin"
add_manpath "$XDG_DATA_HOME/man"
add_infopath "$XDG_DATA_HOME/info"

# include user local profile
[ -f ~/.profile.local ] && . ~/.profile.local
