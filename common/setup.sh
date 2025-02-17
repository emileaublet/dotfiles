#!/bin/env bash
source ~/dotfiles/utils.sh

_add_zsh_variant common

function configureGitIdentity() {
    echo "Email for git config: "
    read git_email
    echo "Full name for git config: "
    read git_name
    git config --global --replace-all user.email $git_email
    git config --global --replace-all user.name $git_name
}

foundEmail=`git config --list | grep email`

if [[ $foundEmail != *"@"* ]]
    then configureGitIdentity
fi

git config --global --replace-all credential.helper cache
git config --global --replace-all color.ui auto
git config --global --replace-all alias.aa "add ."
git config --global --replace-all alias.co "checkout"
git config --global --replace-all alias.cb "checkout -b"
git config --global --replace-all alias.ci "commit"
git config --global --replace-all alias.cia "commit --amend --no-edit"
git config --global --replace-all alias.ri "rebase -i"
git config --global --replace-all alias.p "pull"
git config --global --replace-all alias.pp "push origin"
git config --global --replace-all alias.fa "fetch --all"
git config --global --replace-all alias.rh "reset --hard"
git config --global --replace-all alias.r "checkout main && git fetch --all && git pull && git checkout @{-1} && git rebase main"
git config --global --replace-all alias.l "log --oneline"
