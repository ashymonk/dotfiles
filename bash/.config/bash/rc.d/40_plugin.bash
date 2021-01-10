# sourced by ~/.bashrc

# enable programmable completion features
[[ -f /usr/share/bash-completion/bash_completion && -z ${BASH_COMPLETION_VERSINFO} ]] && \
    source /usr/share/bash-completion/bash_completion

# plugin
[[ -f ~/.local/bin/bashmarks.sh ]] && source ~/.local/bin/bashmarks.sh
[[ -f ~/.local/bin/autojump.bash ]] && source ~/.local/bin/autojump.bash
[[ -f ~/.local/bin/git-prompt.sh ]] && source ~/.local/bin/git-prompt.sh
