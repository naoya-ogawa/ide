#!/bin/sh
vim -u ~/.vimrc -i NONE -c "try | NeoBundleUpdate! | finally | q! | endtry" -e -s -V1

cd /home
#git clone https://github.com/naoya-ogawa/ide.git

git config --global user.email "you@example.com"
git config --global user.name "Your Name"

export GOROOT="/usr/lib64/golang"
export GOPATH=$GOROOT/packages
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

go get github.com/nsf/gocode
echo ''
