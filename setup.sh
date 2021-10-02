#!/bin/bash

DOT_FILES=(.zshrc .zprofile .bashrc .bash_profile .gitignore .vimrc .inputrc .dircolors .tmux.conf)

for file in ${DOT_FILES[@]}
do
    mkdir $HOME/dotfiles_original
    cp -i $HOME/$file $HOME/dotfiles_original/$file
    ln -s $HOME/dotfiles/$file $HOME/$file
done

mv $HOME/.vim $HOME/dotfiles_original/.vim
ln -s $HOME/dotfiles/.vim $HOME/.vim
