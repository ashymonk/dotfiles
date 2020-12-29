# ~/.bashrc: executed by bash(1) for non-login shells.

echo "Sourcing ~/.bashrc..."

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

echo "Loading bashrc.d files..."

for rcfile in $XDG_CONFIG_HOME/bash/bashrc.d/*.bash; do
    [ -f "$rcfile" ] && source "$rcfile"
done
