#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

git_user="fbarros"
git_email="federico.barros@hotmail.com"
git_editor="nvim"

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#install neovim
brew install neovim

#install node
brew install node

#create alias
echo "alias v=nvim" >> ~/.zshrc
echo "alias vi=nvim" >> ~/.zshrc
echo "alias vim=nvim" >> ~/.zshrc


#git configuration
git config --global user.name "$git_user"
git config --global user.email "$git_email"
git config --global core.editor $git_editor

mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -C "$github_email"
ssh-add id_rsa
pbcopy < ~/.ssh/id_rsa.pub
echo "====sshkey copied to clipboard====="
cat ~/.ssh/id_rsa.pub

read -p "Are you sure you put sshkey on github? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ssh -T git@github.com
fi


#neovim configuration
mkdir ~/.config
mkdir ~/.config/nvim

cd ~
ln -s "$parent_path"/vimrc .vimrc

cd ~/.config/nvim
ln -s "$parent_path"/init.vim init.vim
ln -s "$parent_path"/cocrc .cocrc
