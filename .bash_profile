# Good-guy bash profile

export PS1='$(whoami)@$(hostname):[$(pwd)] '

alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias ls="ls -a"
alias pytop='top -p "$(pgrep -d ',' python)"'

alias deskdown='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias deskup='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'

# pull file from remote
function pull_me() {
    scp $1:/home/atandy/$2 ~/Desktop/;
}

# run vertica query and create a csv, then scp to target
function vquery() {
    echo "Running query";
    vert -A -F ',' -e -o $2 -f $1;
    sed -e "$d" $2 > $2.csv;
    scp $2.csv $target:/home/atandy;
}

# start new analyis project
function newp() {
echo "
import fastlib
from link import lnk
import pandas as pd
import numpy as np

fastlib.set_defaults()" | tee $1.py
}
