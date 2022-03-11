#!/bin/env bash

DOT_DIR=~/dotfiles
function dotfiles_update {
    cd $DOT_DIR
    git fetch
    git reset --hard origin/main
    cd -
    zsh "$DOT_DIR/setup.sh"
}

function gcommits() {
  if [ -z $1 ];
  then git log --format="%C(auto)%h (%s, %ad)" -n 20 | cat;
  else git log --format="%H" -n $1 | cat;
  fi
}

function _wrap () {
  alias $1="echo \" ~ $2\" && $2"
}

function use() {
  export SPIN_INSTANCE=$1
}

_wrap gaa "git add ."
_wrap gco "git checkout"
_wrap gcb "git checkout -b"
_wrap gci "git commit"
_wrap gcia "git commit --amend --no-edit"
_wrap gri "git rebase -i"
_wrap gp "git pull"
_wrap gpp "git push origin"
_wrap gfa "git fetch --all"
_wrap grh "git reset --hard"
_wrap gr "git checkout main && git fetch --all && git pull && git checkout @{-1} && git rebase main"
_wrap gl "git log --oneline"
_wrap empty-trash "rm -rf ~/.local/share/Trash/*"

# Kill all processes that match the given name. ie: `killname webpack` will kill all running webpack instances
killname() {
  sudo kill -9 $(ps -e | grep $1 | awk '{print $1}')
}
