#!/bin/bash

# Prompt.
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Minimal without path to working directory (~ $)
# export PS1='\[\e[1;33m\]\W \[\e[1;36m\]\$ \[\e[0m\]'


# ls, exa & more colored stuff.
if which exa >/dev/null; then
	# exa is a modern ls replacement with Git integration: https://the.exa.website
	alias ls="exa -a --color=always --icons --group-directories-first"
        alias ll="exa -la --color=always --icons --group-directories-first"
        alias tree="exa -a --color=always --icons --group-directories-first -T"
else
	alias ls="ls -a --color=always"
	alias ll="ls -l"
	alias la="ls -lA"
fi
for alias in lsl sls lsls sl l s; do alias $alias=ls; done

# Miscellaneous.
stty -ixon              # Disable ctrl-s and ctrl-q.
shopt -s autocd         # Allows you to cd into directory merely by typing the directory name.
shopt -s cdspell        # Automatically correct simple spelling mistakes and typos in directory names.
HISTSIZE= HISTFILESIZE= # Infinite history.

# Aliases.
alias cp="cp -iv"
alias mv="mv -iv"
alias rr="rm -rf -vI"
alias mkd="mkdir -pv"
alias mkex="chmod +x"

alias q="exit"
alias c="clear"
alias e="$EDITOR"
alias v="$EDITOR"
alias sdn="shutdown -h now"

alias .h="cd $HOME"
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
