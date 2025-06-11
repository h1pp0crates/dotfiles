#
# ~/.bashrc
#
function parse_git_branch {
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PROMPT_COMMAND=generator

generator() {
    local EXIT_STATUS="$?"
    local RED='\[\033[31m\]'
    local CYAN='\[\033[36m\]'
    local GREEN='\[\033[32m\]'
    local WHITE='\[\033[0m\]'
    PS1="${CYAN}\W${GREEN}\$(parse_git_branch) "
    if [ $EXIT_STATUS != 0 ]; then
        PS1+="${RED}\$ ${WHITE}"
    else
        PS1+="${WHITE}\$ "
    fi
}

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1="\W\$(parse_git_branch) \$ "

export HISTCONTROL=ignoreboth:erasedups
export WETHER_API="API"
alias vb='vboxmanage startvm OracleLinux9.5 --type headless; ssh vbm'

alias fasmm='fasm main.asm && ld main.o -o main'

export PATH="$HOME/go/bin:$PATH"
