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
    path="$(readlink -f "$1")"
    [ -d "$path" ] &&
        case ":$PATH:" in
          *":$path:"*) :;; # already there
          *) export PATH="$path:$PATH";; # add path
        esac
}
add_manpath() {
    path="$(readlink -f "$1")"
    [ -d "$path" ] &&
        case ":$MANPATH:" in
          *":$path:"*) :;; # already there
          *) export MANPATH="$path:$MANPATH";; # add path
        esac
}
add_infopath() {
    path="$(readlink -f "$1")"
    [ -d "$path" ] &&
        case ":$INFOPATH:" in
          *":$path:"*) :;; # already there
          *) export INFOPATH="$path:$INFOPATH";; # add path
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
export EXINIT='source $HOME/.exrc'
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export RUST_SRC_PATH="$(rustc --print sysroot 2>/dev/null)/lib/rustlib/src/rust/src"

# go
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"

# ctags
export CTAGS="--options=$XDG_CONFIG_HOME/ctags/ctags.conf"

# gtags
export GTAGSCONF="$XDG_CONFIG_HOME/gtags/gtags.conf"
export GTAGSLABEL=pygments

# bashmarks
export SDIRS="$XDG_DATA_HOME/bash/sdirs"

# readline
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# Android Studio
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

# Path
add_path "$HOME/bin"
add_path "$HOME/.local/bin"
add_path "$CARGO_HOME/bin"
add_path "$GOBIN"
add_path "$ANDROID_HOME/platform-tools"
add_manpath "$XDG_DATA_HOME/man"
add_infopath "$XDG_DATA_HOME/info"

# include user local profile
[ -f ~/.profile.local ] && . ~/.profile.local
