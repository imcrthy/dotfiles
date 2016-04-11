#!/usr/bin/env bash

set -e

cwd=$(pwd)
mkdir -p home/.vim
cd home/.vim

mkdir -p ./tmp
mkdir -p ~/.vim-tmp

[ -e "autoload/plug.vim" ] ||
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p bundle
vim +PlugClean +PlugInstall +qall

