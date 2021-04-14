#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize


[[ -f /etc/bash/aliases ]] && . /etc/bash/aliases
[[ -f /etc/bash/dircolors ]] && eval "$(dircolors -b /etc/bash/dircolors)"
[[ -f /etc/bash/bash_globals ]] && . /etc/bash/bash_globals

################## PS1 ###################


if [[ -f /etc/bash/bash_ps1 ]]; then
    source /etc/bash/bash_ps1
    export PROMPT_COMMAND=prompt_command
else
    export PROMPT_COMMAND=fallback_prompt_command
fi

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

function fallback_prompt_command() {
    PS1="\[\e[33m\]\u\[\e[m\]\[\e[35m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\] \[\e[36m\]>\[\e[m\] [\[\e[32m\]\w\[\e[m\]]"
}

#source /etc/bash/aliases
