# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'


# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# --------------------------------------------------


# Environment variables
# --------------------------------------------------
# Fix color issue
if [ "$TERM" = "xterm" ]; then
    export TERM=xterm-256color
fi

# Set default editor
export EDITOR=vim


# Aliases
# --------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd.='cd ..'
alias cd..='cd ..'
alias lla='ls -al'
alias llt='ls -Alh --time-style +"%F %T"'
alias lld='ls -AlhF --group-directories-first --time-style +"%F %T"'
alias tmuxn='tmux new -s'
alias tmuxa='tmux a'
alias tmuxat='tmux a -t'
alias tmuxks='tmux kill-session -t'
alias pping='prettyping'


# Prompt
# --------------------------------------------------
# Completion support for core Git
# See: https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
#source ~/.git-completion.bash

# Git prompt support, Show repository status in prompt
# See: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#source ~/.git-prompt.sh

# Customize prompt
# 黄色 + 蓝色路径
export PS1="\[\e[33m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[34m\]\w\[\e[m\]\[\e[33m\]]\[\e[m\]\[\e[33m\]\\$\[\e[m\] "

# 黄色 + 蓝色路径 + 绿色 git
#export PS1="\[\e[33m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[34m\]\w\[\e[m\]\[\e[32m\]\$(__git_ps1 ' (%s)')\[\e[m\]\[\e[33m\]]\[\e[m\]\[\e[33m\]\\$\[\e[m\] "


# Others
# --------------------------------------------------
### fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### z.lua
eval "$(lua /usr/local/bin/z.lua --init bash enhanced once fzf)"

alias zc='z -c'          # 严格匹配当前路径的子路径
alias zi='z -i'          # 使用交互式选择模式
alias zf='z -I'          # 使用 fzf 对多个结果进行选择
alias zb='z -b'          # 快速回到父目录
alias zh='z -I -t .'     # 历史路径, fzf 交互模式
alias zbi='z -b -i'      # 返回父目录, 交互模式
alias zbf='z -b -I'      # 返回父目录, fzf 交互模式

### SSL certificate
. "/root/.acme.sh/acme.sh.env"
