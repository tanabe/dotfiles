# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

PS1="[\u@\h \w]\$ "

alias tig='tig status'
alias ll='gls -l -a --color=auto'

function share_history {
    history -a
    history -c
    history -r
}

PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999
stty stop undef

export SVN_EDITOR=vim

