#!/bin/sh
vim -u ~/.vimrc -i NONE -c "try | NeoBundleUpdate! | finally | q! | endtry" -e -s -V1
