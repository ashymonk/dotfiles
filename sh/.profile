# ~/.profile

echo "Loading ~/.profile..." >&2

# Functions
export_lang() {
    if LC_ALL=C locale -a | grep -qx "$1"; then
        LANG="$1"
        export LANG
        return 0
    fi
    return 1
}

add_path() {
    _path=$(readlink -f "$1" 2>/dev/null || printf '%s\n' "$1")
    [ -d "$_path" ] || return 0
    case ":$PATH:" in
        *":$_path:"*) ;;  # already there
        *) PATH="$_path${PATH:+:$PATH}"; export PATH ;;
    esac
}

add_manpath() {
    _path=$(readlink -f "$1" 2>/dev/null || printf '%s\n' "$1")
    [ -d "$_path" ] || return 0
    case ":$MANPATH:" in
        *":$_path:"*) ;;  # already there
        *) MANPATH="$_path${MANPATH:+:$MANPATH}"; export MANPATH ;;
    esac
}

add_infopath() {
    _path=$(readlink -f "$1" 2>/dev/null || printf '%s\n' "$1")
    [ -d "$_path" ] || return 0
    case ":$INFOPATH:" in
        *":$_path:"*) ;;  # already there
        *) INFOPATH="$_path${INFOPATH:+:$INFOPATH}"; export INFOPATH ;;
    esac
}

# umask
if [ "$(id -ur)" -gt 199 ] && [ "$(id -gn)" = "$(id -un)" ]; then
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

# Run Commands
export ENV="$HOME/.shrc"

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
if command -v rustc >/dev/null 2>&1; then
    RUST_SRC_PATH="$(rustc --print sysroot 2>/dev/null)/lib/rustlib/src/rust/src"
    export RUST_SRC_PATH
fi

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
add_path "$ANDROID_HOME/build-tools"
add_path "$ANDROID_HOME/cmdline-tools/latest/bin"
add_manpath "$XDG_DATA_HOME/man"
add_infopath "$XDG_DATA_HOME/info"

# include user local profile
[ -f "$HOME/.profile.local" ] && . "$HOME/.profile.local"

# include profile for X
[ -n "$DISPLAY" ] && [ -f "$HOME/.xprofile" ] && . "$HOME/.xprofile"
