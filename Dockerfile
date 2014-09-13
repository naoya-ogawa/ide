FROM centos:latest
MAINTAINER original <test@example.com>

Run yum -y install vim
Run mkdir /home/dotfiles
Add _vimrc /home/dotfiles
Run ln -s /homde/dotfiles/_vimrc /.vimrc
