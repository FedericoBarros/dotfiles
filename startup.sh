#!/bin/bash

mkdir ~/.config
mkdir ~/.config/nvim

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd ~
ln -s "$parent_path"/vimrc .vimrc

cd ~/.config/nvim
ln -s "$parent_path"/init.vim init.vim
ln -s "$parent_path"/cocrc .cocrc
