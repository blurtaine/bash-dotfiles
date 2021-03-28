#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize


[[ -f /etc/bash/bash_ps1 ]] && . /etc/bash/bash_ps1
[[ -f /etc/bash/aliases ]] && . /etc/bash/aliases
#[[ -f /etc/bash/bash_dircolors ]] && . /etc/bash/bash_dircolors
[[ -f /etc/bash/bash_globals ]] && . /etc/bash/bash_globals

################## PS1 ###################


if [[ -f /etc/bash/bash_ps1 ]]; then
    source /etc/bash/bash_ps1
    export PROMPT_COMMAND=prompt_command
else
    export PROMPT_COMMAND=fallback_prompt_command
fi

function fallback_prompt_command() {
    PS1="\[\e[33m\]\u\[\e[m\]\[\e[35m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\] \[\e[36m\]>\[\e[m\] [\[\e[32m\]\w\[\e[m\]]"
}

################# LS ######################

#if [[ -f /etc/bash/bash_dircolors ]]; then
#    source /etc/bash/bash_dircolors
#fi

#export LS_COLORS="di=4;34:ex=1;32"


################# TERM ###################

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

#source /etc/bash/aliases
