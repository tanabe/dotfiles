#!/bin/bash

DOT_FILES=(.bashrc .bash_profile .dircolors .gitignore .screenrc .vimrc .vim .inputrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
