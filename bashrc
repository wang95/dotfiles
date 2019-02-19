# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias lla='ls -al'
alias tmuxn='tmux new -s'
alias tmuxks='tmux kill-session -t'


# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


# Fix color issue
if [ "$TERM" = "xterm" ]; then
    export TERM=xterm-256color
fi


# Completion support for core Git
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
#source ~/.git-completion.bash

# Git prompt support, Show repository status in prompt
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#source ~/.git-prompt.sh


# Customize prompt
# 黄色 + 蓝色路径
export PS1="\[\e[33m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[34m\]\W\[\e[m\]\[\e[33m\]]\[\e[m\]\[\e[33m\]\\$\[\e[m\] "


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
