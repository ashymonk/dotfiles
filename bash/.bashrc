# ~/.bashrc: executed by bash(1) for non-login shells.

echo "Sourcing ~/.bashrc..."

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac




# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# plugin
[[ -f ~/.local/bin/bashmarks.sh ]] && source ~/.local/bin/bashmarks.sh
[[ -f ~/.local/bin/autojump.bash ]] && source ~/.local/bin/autojump.bash
[[ -f ~/.local/bin/git-prompt.sh ]] && source ~/.local/bin/git-prompt.sh

for rcfile in $XDG_CONFIG_HOME/bash/bashrc.d/*.bash; do
    [ -f "$rcfile" ] && source "$rcfile"
done
