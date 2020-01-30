#!/bin/sh

if [ ! -e ~/.vimrc ]; then
    ln -s ~/.vim/.vimrc ~/.vimrc
fi

if [ ! -e ~/.vim/bundle/syntastic/LICENSE ]; then
    cd ~/.vim/
    git submodule init
    git submodule update
fi

