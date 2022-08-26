#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias yeet='rm -rf'
PS1='[\u@\h \W]\$ '
alias config='/usr/bin/git --git-dir=/home/dane/.cfg/ --work-tree=/home/dane'
