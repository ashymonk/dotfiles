# sourced by ~/.bashrc

# enable programmable completion features
[[ -z $BASH_COMPLETION_VERSINFO && -f /usr/share/bash-completion/bash_completion ]] && \
    source /usr/share/bash-completion/bash_completion

# plugin
[[ -f ~/.local/bin/bashmarks.sh ]] && source ~/.local/bin/bashmarks.sh
[[ -f ~/.local/bin/autojump.bash ]] && source ~/.local/bin/autojump.bash
[[ -f ~/.local/bin/git-prompt.sh ]] && source ~/.local/bin/git-prompt.sh
